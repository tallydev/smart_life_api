json.self do
  json.today_count @today_sport.count
  json.avg_count @avg_count
  json.count @sport.count
  json.rank @rank
  json.rank_percent @rank_percent
end

if @detail_sports.present?
  json.detail(@detail_sports) do |tag, count|
    json.tag tag
    json.count count
  end
end

index = 0
json.top(@top_sports) do |sport|
  index += 1
  user_info = sport.user.user_info
  json.index index
  json.avatar user_info.avatar.try(:url, :medium)
  json.nickname user_info.nickname
  json.count sport.count
end