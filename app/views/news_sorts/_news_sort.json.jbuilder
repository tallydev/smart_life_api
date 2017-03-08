json.extract! news_sort, :id, :rank, :title, :created_at
json.news_sort_cover image_url news_sort.news_sort_cover.try(:url, :s750) 