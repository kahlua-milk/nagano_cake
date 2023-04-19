class Product < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  attribute :stock, :integer, default: 0
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # ジャンルに対するバリデーションを追加する場合は以下を使用
  # validates :genre, presence: true
end