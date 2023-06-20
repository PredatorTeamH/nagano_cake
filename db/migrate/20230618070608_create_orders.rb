class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :shipping_zip_code, null: false
      t.string :shipping_address, null: false
      t.string :address_name, null: false
      t.string  :payment_methods, null: false
      t.integer  :freight, null: false
      t.integer  :total_price, null: false
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
