class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :price, null: false
      t.integer :sale_status, null: false
      t.timestamps
    end
  end
end
