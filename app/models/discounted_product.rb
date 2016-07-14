class DiscountedProduct < ActiveRecord::Base
  belongs_to :discounted_sale
  belongs_to :product
end
