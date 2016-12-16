json.extract! product, :id, :title, :price, :count, :detail, :sort, :discount_rate, :after_discount, :sales
json.product_cover image_url product.product_cover.try(:url, :medium)
json.product_detail image_url product.product_detail.try(:url, :s750)
json.product_banners product.product_banners do |product_banner|
	json.id product_banner.id
	json.url image_url product_banner.thumb.try(:url, :medium)		
end