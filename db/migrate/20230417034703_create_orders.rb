class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.integer :postage, null: false
      t.integer :payment_option, null: false
      t.integer :total_amount, null: false
      t.integer :order_status, null: false
      t.timestamps
    end
  end
end
