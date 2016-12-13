json.extract! @cart_item, :id, :product_id, :amount, :count, :state, :state_alias, :title, :price, :product_sort, :created_at
json.thumb image_url @cart_item.product.try(:product_cover).try(:url, :medium)
