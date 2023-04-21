class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer.id
    # @customer = Customer.find(current_customer.id)
  end


  def create
    cart_products = current_customer.cart_products.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_products.each do |cart_product|
        order_product = OrderProduct.new
        order_product.product_id = cart_product.product_id
        order_product.order_id = @order.id
        order_product.quantity = cart_product.quantity 
        order_product.price = cart_product.product.with_tax_price
        order_product.save
      end
      redirect_to thanks_path
      cart_products.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end


  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.postal_code = order_params[:postal_code]
      @order.address = order_params[:address]
      @order.name = order_params[:name]
    # その前にセーブしないとダメでは?
    else
      render :new
    end

    # この記述ではないかも
    @order = Order.new(order_params)
    if params[:order][:payment_option] == Order.payment_options.key(0)
      @order.payment = Order.payment_options_i18n[:credit_card]
    elsif params[:order][:payment_option] == Order.payment_options.key(1)
      @order.payment = Order.payment_options_i18n[:transfer]
    else
      render :new
    end
    @cart_products = current_customer.cart_products.all
    @total = @cart_products.inject(0) { |sum, product| sum + product.subtotal }

  end



  def thanks
  end


  def index
    @orders = current_customer.orders.all
  end


  def show
    @order = Order.find(params[:id])
    @total = @cart_products.inject(0) { |sum, product| sum + product.subtotal }
  end



  private
  def order_params
    params.require(:order).permit(:payment_option, :postal_code, :address, :name, :postage, :total_amount)
  end



end
