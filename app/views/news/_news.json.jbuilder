json.extract! news, :id, :news_sort_id, :title, :updated_at
json.created_at news.created_at.strftime("%Y-%m-%d %H:%M:%S")
json.content news.content_replace_image_url
json.news_cover image_url news.news_cover.try(:url, :s750)
json.news_detail image_url news.news_detail.try(:url, :s750)