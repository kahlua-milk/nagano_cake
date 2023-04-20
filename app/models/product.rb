class Product < ApplicationRecord

 has_one_attached :image

 has_many :cart_products, dependent: :destroy
 has_many :order_products, dependent: :destroy
 belongs_to :genre


  with_options presence: true do
    validates :name
    validates :explanation
    validates :price
    validates :sale_status
    validates :image


  enum sale_status: { sale: 0, stop_selling: 1 }
  enum genre: { cake: 0, pudding: 1, baked_goods: 2 }

  def self.genres
    genres = {}
    self.genre.keys.each do |genre|
      genres[Product.genres_i18n[genre.to_s]] = self.genre[genre]
    end
    genres
  end

  enum sale_status: { '販売停止中': 0, '販売中': 1 }, _default: 0
  enum genre: { cake: 0, pudding: 1, baked_goods: 2 }

  def self.genres_i18n
    I18n.t('activerecord.attributes.product.genre')
  end

  def self.sale_status_i18n
    I18n.t('activerecord.attributes.product.sale_status')


  def with_tax_price
    (price * 1.1).floor
  end
end
