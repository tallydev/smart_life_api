json.orders @orders.each do |order|
  json.(order, :id, :seq, :price, :state, :state_alias, :pay_way, :need_postage, :postage, :contact_id, :user_id, :created_at, :updated_at)

  json.cart_items(order.cart_items) do |cart_item|
	  json.extract! cart_item, :id, :product_id, :amount, :count, :title, :price, :state, :state_alias, :user_id, :product_sort, :created_at
	  json.thumb image_url cart_item.product.try(:product_cover).try(:url, :medium)
	end

  json.url order_url(order, format: :json)
end
