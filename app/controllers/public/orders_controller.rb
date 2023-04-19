class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer.id
    # @customer = Customer.find(current_customer.id)
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

    @cart_products = CartProduct.all
  end


  def thanks
  end



  private
  def order_params
    params.require(:order).permit(:payment_option, :postal_code, :address, :name)
  end

end
