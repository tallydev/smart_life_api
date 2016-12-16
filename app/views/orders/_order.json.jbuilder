json.extract! order, :id, :seq, :price, :state, :state_alias, :pay_way, :pay_way_alias, :need_postage, :postage, :without_postage, :contact_id, :user_id, :created_at, :updated_at, :created_at_output, :updated_at_output, :paid_time_output

json.cart_items order.cart_items, partial: 'cart_items/cart_item', as: :cart_item
