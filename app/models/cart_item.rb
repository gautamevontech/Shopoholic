class CartItem < ActiveRecord::Base
  belongs_to :my_cart
  belongs_to :product, foreign_key:"product_id"
end
