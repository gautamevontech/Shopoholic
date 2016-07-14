class MyCart < ActiveRecord::Base
  has_many :cart_items, foreign_key: "cart_id"
  has_one :order
  belongs_to :user
  belongs_to :address, foreign_key: "delivery_address"
end
