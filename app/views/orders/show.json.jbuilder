json.extract! @order, :id, :price, :state, :state_alias, :pay_way, :contact_id, :user_id, :created_at, :updated_at
json.cart_items @order.cart_items, :id, :product_id, :user_id, :count, :amount, :state, :state_alias, :created_at, :updated_at

