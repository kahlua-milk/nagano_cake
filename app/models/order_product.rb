class OrderProduct < ApplicationRecord

  belongs_to :order
  belongs_to :product


  enum production_status: { cannot_start: 0, unfinished: 1, production: 2, completion: 3 }, _prefix: true


  def subtotal
    product.with_tax_price * quantity
  end


  # def total_quantity
  #   array = []
  #   OrderProduct.all.each do |order_product|
  #     array << order_product.quantity
  #   end
  #   array.sum

  #   # OrderProduct.all.sum(:quantity)
  # end

end
