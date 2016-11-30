json.extract! @product, :id, :title, :price

json.product_banners @product.product_banners do |product_banner|
	json.id product_banner.id
	json.url product_banner.thumb.try(:url, :medium)		
end

json.product_cover @product.product_cover.try(:url, :medium)

