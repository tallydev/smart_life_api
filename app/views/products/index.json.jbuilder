json.total_pages @products.total_pages
json.current_page @products.current_page

json.products(@products) do |product|
  json.extract! product, :id, :title, :price
  json.thumb product.thumb.try(:url, :medium)
end
