class CreateMyCarts < ActiveRecord::Migration
  def change
    create_table :my_carts do |t|

      t.timestamps null: false
    end
  end
end
