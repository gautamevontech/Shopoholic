class DiscountedSale < ActiveRecord::Base
  has_many :discounted_products
  has_many :products, through: :discounted_products
end
