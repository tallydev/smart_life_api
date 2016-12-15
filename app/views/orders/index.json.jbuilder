json.orders @orders.each do |order|
  json.(order, :id, :seq, :price, :state, :state_alias, :pay_way, :need_postage, :postage, :contact_id, :user_id, :created_at, :updated_at)
  json.cart_items order.cart_items
  json.url order_url(order, format: :json)
end
