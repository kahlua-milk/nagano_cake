class Product < ApplicationRecord
<<<<<<< HEAD
  has_one_attached :image
=======

 has_one_attached :image
>>>>>>> 5ca6c870c93aa766219c98b9172f8a20ec8bd68d

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price
    validates :sale_status
    validates :image
  end

  enum sale_status: { '販売停止中': 0, '販売中': 1 }, _default: 0
  enum genre: { cake: 0, pudding: 1, baked_goods: 2 }

  def self.genres_i18n
    I18n.t('activerecord.attributes.product.genre')
  end
<<<<<<< HEAD

  def self.sale_status_i18n
    I18n.t('activerecord.attributes.product.sale_status')
  end
=======
>>>>>>> 5ca6c870c93aa766219c98b9172f8a20ec8bd68d
end
