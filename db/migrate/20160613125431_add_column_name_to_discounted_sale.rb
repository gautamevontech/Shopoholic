class AddColumnNameToDiscountedSale < ActiveRecord::Migration
  def change
    add_column :discounted_sales, :name, :string
  end
end
