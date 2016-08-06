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

