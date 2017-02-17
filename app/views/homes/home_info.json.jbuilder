# 轮播图
json.banners @banners.each do |banner|
	json.(banner, :id, :title, :position, :banner_type, :type_id)
	json.banner_cover image_url banner.banner_cover.try(:url, :s750)
	json.banner_detail image_url banner.banner_detail.try(:url, :s750)
end

# 新品上市模块
json.newer do
  json.url image_url @promotion ? @promotion.product_cover.try(:url, :medium) : ""
  json.end_time @promotion ? @promotion.expiration_time : Time.zone.now
end

# 首页模块信息
# if
	json.home_blocks  @home_blocks && @home_blocks.each do |home_block| 
		json.(home_block, :title, :ranking)
		json.home_block_cover image_url home_block.home_block_cover.try(:url, :s750)
	end
# end
