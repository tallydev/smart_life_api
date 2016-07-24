json.array!(@products) do |product|
  json.extract! product, :id, :title, :price
  json.thumb product.thumb.try(:url, :medium)
end
