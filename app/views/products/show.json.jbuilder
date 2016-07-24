json.extract! @product, :id, :title, :price
json.thumb @product.thumb.try(:url, :medium)
