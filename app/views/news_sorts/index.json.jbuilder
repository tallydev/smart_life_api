json.array!(@news_sorts) do |news_sort|
  json.extract! news_sort, :id
  json.url news_sort_url(news_sort, format: :json)
end
