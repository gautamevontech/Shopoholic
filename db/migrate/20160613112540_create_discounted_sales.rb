class CreateDiscountedSales < ActiveRecord::Migration
  def change
    create_table :discounted_sales do |t|
      t.integer :discount_percent
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
