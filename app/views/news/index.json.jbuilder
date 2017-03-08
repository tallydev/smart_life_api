json.array!(@news) do |news|
  json.extract! news, :id
  json.url news_url(news, format: :json)
end
