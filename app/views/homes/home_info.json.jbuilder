# 轮播图
json.banners @banners.each do |banner|
	json.(banner, :id, :title, :position, :type, :type_id)
	json.banner_cover image_url banner.banner_cover.try(:url, :s750)
	json.banner_detail image_url banner.banner_detail.try(:url, :s750)
end