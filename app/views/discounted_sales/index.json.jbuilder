json.array!(@discounted_sales) do |discounted_sale|
  json.extract! discounted_sale, :id, :discount_percent, :start_date, :end_date
  json.url discounted_sale_url(discounted_sale, format: :json)
end
