class CreateDiscountedProducts < ActiveRecord::Migration
  def change
    create_table :discounted_products do |t|
      t.integer :discounted_sale_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
