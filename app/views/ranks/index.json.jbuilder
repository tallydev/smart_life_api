json.total_pages @top_sports.total_pages
json.current_page @top_sports.current_page

index = (@page.to_i - 1) * @per_page.to_i rescue 0
json.top(@top_sports) do |sport|
	user_info = sport.user.try(:info)
	index += 1
	json.index index
	json.avatar image_url user_info.try(:avatar).try(:url, :medium)
	json.nickname user_info.try(:nickname)
	json.count sport.try(:count)
end