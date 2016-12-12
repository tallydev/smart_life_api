json.total_pages @products.total_pages
json.current_page @products.current_page

json.products(@products) do |product|
  json.extract! product, :id, :title, :price, :count, :detail, :sort
  json.product_cover image_url product.product_cover.try(:url, :medium)
  json.product_detail image_url product.product_detail.try(:url, :s750)
	json.product_banners product.product_banners do |product_banner|
		json.id product_banner.id
		json.url image_url product_banner.thumb.try(:url, :medium)		
	end
end
