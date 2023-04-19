class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.string :image_url
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end