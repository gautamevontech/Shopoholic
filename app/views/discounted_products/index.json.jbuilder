json.array!(@discounted_products) do |discounted_product|
  json.extract! discounted_product, :id, :discounted_sale_id, :product_id
  json.url discounted_product_url(discounted_product, format: :json)
end
