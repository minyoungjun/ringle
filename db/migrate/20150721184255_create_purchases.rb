class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string  :name
      t.string  :email
      t.string  :phone
      t.string  :post_code
      t.text  :address
      t.boolean :checkout, default: false
      t.integer :plan #0: 200000won; 1: 4000000won
      t.integer :amount #money
      t.integer :method
      t.timestamps null: false
    end
  end
end
