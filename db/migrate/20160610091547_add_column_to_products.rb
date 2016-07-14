class AddColumnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :image, :string
    add_column :products, :price, :decimal
  end
end
