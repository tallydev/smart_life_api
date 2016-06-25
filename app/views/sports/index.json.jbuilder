json.array!(@sports) do |sport|
  json.extract! sport, :id
  json.url sport_url(sport, format: :json)
end
