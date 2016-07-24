json.extract! @cart_item, :id, :product_id, :amount, :count, :state, :title, :price, :created_at
json.thumb @cart_item.product.try(:thumb).try(:url, :medium)
