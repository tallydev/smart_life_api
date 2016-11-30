json.(@activity_sqhd, :id, :title)
json.image @activity_sqhd.image.try(:url, :medium)
json.detail_image @activity_sqhd.detail_image.try(:url, :medium)
