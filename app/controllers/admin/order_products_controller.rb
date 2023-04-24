class Admin::OrderProductsController < ApplicationController


  def update
    # @order = Order.find(params[:order_id])
    @order = Order.find(params[:id])
    @order_product = OrderProduct.find(params[:id])
    @order_products = @order.order_products.all
    @order_product.production_status = 0

    # 製作ステータスが「製作中」のときに、注文ステータスを「製作中」に更新する。
    is_updated = true
    if @order_product.update(order_product_params)
       @order.update(order_status: 2) if @order_product.production_status == "production"
    # 紐付いている注文商品の製作ステータスがすべて製作完了になった際に注文ステータスを「発送準備中」に更新する。
       @order_products.each do |order_product|
         if order_product.production_status != "completion"
           is_updated = false
         end
       end
       @order.update(order_status: 3) if is_updated
    end
    redirect_to admin_order_path(@order)
  end




  private
  def order_product_params
    params.require(:order_product).permit(:production_status)
  end

end
