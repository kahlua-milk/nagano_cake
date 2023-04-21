class Admin::HomesController < ApplicationController


  def top
    @orders = Order.all.page(params[:page])
    @orders = Order.all.order(created_at: :desc)
  end

end
