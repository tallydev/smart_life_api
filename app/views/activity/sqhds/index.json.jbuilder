json.activity_sqhds(@activity_sqhds) do |activity_sqhd|
  json.extract! activity_sqhd, :id, :title
  json.image image_url activity_sqhd.image.try(:url, :s750)
  json.detail_image image_url activity_sqhd.detail_image.try(:url, :s750)
  json.url activity_sqhd_url(activity_sqhd, format: :html)
end
