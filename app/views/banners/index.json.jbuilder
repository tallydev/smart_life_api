json.banners (@banners) do |banner|
  json.extract! banner, :id, :title
  json.url image_url banner.image.try(:url, :product)
end
