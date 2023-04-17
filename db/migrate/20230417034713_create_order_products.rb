class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity, null: false
      t.integer :price, null: false
      t.integer :production_status, null: false
      t.timestamps
    end
  end
end
