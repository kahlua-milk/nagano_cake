class Admin::HomesController < ApplicationController


  def top
    @orders = Order.page(params[:page]).order(created_at: :desc)
    # @orders = Order.all.order(created_at: :desc)
    @total = 0
  end


end
