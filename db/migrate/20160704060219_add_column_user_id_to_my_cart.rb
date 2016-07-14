class AddColumnUserIdToMyCart < ActiveRecord::Migration
  def change
    add_column :my_carts, :user_id, :integer
  end
end
