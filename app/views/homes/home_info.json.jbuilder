# 轮播图
json.banners @banners.each do |banner|
	json.(banner, :id, :title, :position, :banner_type, :type_id)
	json.banner_cover image_url banner.banner_cover.try(:url, :s750)
	json.banner_detail image_url banner.banner_detail.try(:url, :s750)
end

# 新品上市模块
json.newer do
  json.url image_url @promotion ? @promotion.product_cover.try(:url, :medium) : ""
  json.end_time @promotion ? @promotion.expiration_time : (Time.zone.now + 3.hour).strftime("%F %T")
end