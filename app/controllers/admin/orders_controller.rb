class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @total = @cart_products.inject(0) { |sum, product| sum + product.subtotal }
  end


  def update
  end









end
