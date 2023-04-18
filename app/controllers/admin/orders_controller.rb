class Admin::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @customer = Customer.all
    
  end
end
