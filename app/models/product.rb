class Product < ApplicationRecord
<<<<<<< HEAD
has_one_attached :profile_image

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
=======

  has_one_attached :image

>>>>>>> 22c14b18ff136a801ecd715b05a9a8c251389462
end
