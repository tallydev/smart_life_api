json.extract! @cart_item, :id, :product_id, :amount, :count, :state, :state_alias, :title, :price, :created_at
json.thumb @cart_item.product.try(:thumb).try(:url, :medium)
