json.extract! news, :id, :news_sort_id, :title, :created_at, :updated_at
json.content news.content_replace_image_url
json.news_cover image_url news.news_cover.try(:url, :s750)
json.news_detail image_url news.news_detail.try(:url, :s750)