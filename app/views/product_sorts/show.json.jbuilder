json.extract! @product_sort, :id, :title, :created_at, :updated_at

json.product_sort_icon image_url @product.product_sort_icon.try(:url, :medium)
