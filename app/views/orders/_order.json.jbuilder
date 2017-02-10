json.extract! order, :id, :seq, :price, :state, :state_alias, :pay_way, :pay_way_alias, :need_postage, :postage, :without_postage, :contact_id, :user_id, :created_at, :updated_at, :created_at_output, :updated_at_output, :paid_time_output, :subdistrict_id
json.contact order.contact, partial: 'contacts/contact', as: :contact

if order.cart_item_info.nil? || order.cart_item_info.empty? 
	json.cart_items order.cart_items, partial: 'cart_items/cart_item', as: :cart_item
else
  _cart_items = order.cart_item_info.split("@;@").map do |cart_item|
    _info = cart_item.split("@*@")
    _thumb_url = image_url CartItem.find(_info[0]).product.try(:product_cover).try(:url, :medium)
    { 
    	id: _info[0].to_i,
      title: _info[1],
      after_discount: _info[2].to_f,
      price: _info[3].to_f,
      count: _info[4].to_i,
      thumb: _thumb_url
    }
  end
  json.cart_items _cart_items
end

