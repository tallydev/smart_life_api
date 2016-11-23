json.activity_sqhds(@activity_sqhds) do |activity_sqhd|
  json.extract! activity_sqhd, :id, :title
  json.image activity_sqhd.image.try(:url, :medium)
  json.url activity_sqhd_url(activity_sqhd, format: :html)
end
