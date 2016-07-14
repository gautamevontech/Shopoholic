class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :category, class_name: 'ProductCategory'
  has_many :carts
  has_many :cart_items
  has_one :discounted_product
  has_one :discounted_sale, through: :discounted_product


  def discounted_price
    if discounted_sale.present? && discounted_sale.start_date <= Date.today && discounted_sale.end_date >= Date.today
      dp = (price-((price*discounted_sale.discount_percent)/100))
    end
    dp
  end
end