class Order < ApplicationRecord

  has_many :order_products, dependent: :destroy
  belongs_to :customer


 enum order_status: { not_payment: 0, confirmation: 1, production: 2, shipping: 3, shipped: 4 }, _prefix: true
 enum payment_option: { credit_card: 0, transfer: 1 }


end

