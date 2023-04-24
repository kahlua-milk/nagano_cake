class Product < ApplicationRecord
  has_one_attached :image

  has_many :cart_products, dependent: :destroy
  has_many :order_products, dependent: :destroy
  belongs_to :genre

  enum sale_status: { sale: 0, stop_selling: 1 }, _prefix: true


  with_options presence: true do
    validates :name
    validates :explanation
    validates :price
    validates :sale_status
    validates :image
  end

  def with_tax_price
    (price * 1.1).floor
  end
end
