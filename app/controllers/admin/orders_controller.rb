class Admin::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = Customer.find(current_customer.id)

  end


  def thanks
  end
end
