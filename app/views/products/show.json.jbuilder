json.extract! @product, :id, :title, :price
json.thumb do 
	json.array! @product.thumbs do |x|
		json.id x.id
		json.url x.try(:url, :medium)		
	end
end
