json.total_pages @products.total_pages
json.current_page @products.current_page

json.products(@products) do |product|
  json.extract! product, :id, :title, :price

	json.array! product.thumbs do |x|
		json.id x.id
		json.url x.try(:url, :mini)		
	end
end
