json.extract! news, :id, :news_sort_id, :title, :content, :created_at, :updated_at
json.news_cover image_url news.news_cover.try(:url, :s750)
json.news_detail image_url news.news_detail.try(:url, :s750)