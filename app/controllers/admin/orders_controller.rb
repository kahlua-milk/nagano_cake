class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products.all
    @total = @order_products.inject(0) { |sum, product| sum + product.subtotal }
  end


  def update
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: params[:id])
    # 注文ステータスが「入金確認」とき、製作ステータスを全て「製作待ち」に更新する。
    if @order.update(order_params)
      @order_products.update_all(production_status: 1) if @order.order_status == "confirmation"
    end
    redirect_to admin_order_path(@order)
  end




  private
  def order_params
    params.require(:order).permit(:order_status)
  end









end
