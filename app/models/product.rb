class Product < ApplicationRecord

 has_one_attached :image

 has_many :cart_products, dependent: :destroy
 has_many :order_products, dependent: :destroy
 belongs_to :genre


  enum sale_status: { sale: 0, stop_selling: 1 }
  enum genre: { cake: 0, pudding: 1, baked_goods: 2 }

  def self.genres
    genres = {}
    self.genre.keys.each do |genre|
      genres[Product.genres_i18n[genre.to_s]] = self.genre[genre]
    end
    genres
  end

  def self.genres_i18n
    I18n.t('activerecord.attributes.product.genre')
  end

  def with_tax_price
    (price * 1.1).floor
  end
end
