class Public::CartProductsController < ApplicationController
  before_action :authenticate_customer!


  def index
    @cart_products = current_customer.cart_products.all
    @total = @cart_products.inject(0) { |sum, product| sum + product.subtotal }
  end


  def create
    @cart_product = current_customer.cart_products.build(cart_product_params)
    @cart_products = current_customer.cart_products.all
    @cart_products.each do |cart_product|
      if cart_product.product_id == @cart_product.product_id
        new_quantity = cart_product.quantity + @cart_product.quantity.to_i
        cart_product.update_attribute(:quantity, new_quantity)
        @cart_product.delete
      end
    end
    @cart_product.save
    redirect_to cart_items_path(@cart_product), notice: "カートに商品が入りました"
  end


  def update
    @cart_product = CartProduct.find(params[:id])
    if @cart_product.update(cart_product_params)
      redirect_to cart_items_path(@cart_product), notice: "カート内商品の数量を変更しました"
    end
  end


  def destroy
    @cart_product = CartProduct.find(params[:id])
    # if cart_product.customer_id == current_customer
    @cart_product.destroy
      redirect_to cart_items_path, notice: "カート内商品を削除しました"
    # end
  end


  def destroy_all
    # if cart_product.customer_id == current_customer.id
    # CartProduct.destroy
    current_customer.cart_products.destroy_all
    redirect_to cart_items_path, notice: "カートが空になりました"
    # end
  end



  private
  def cart_product_params
    params.require(:cart_product).permit(:product_id, :quantity, :customer_id)
  end
end
