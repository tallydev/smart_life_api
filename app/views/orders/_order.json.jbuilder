json.extract! order, :id, :seq, :price, :state, :state_alias, :pay_way, :need_postage, :postage, :contact_id, :user_id, :created_at, :updated_at, :created_at_output, :updated_at_output

json.cart_items order.cart_items, partial: 'cart_items/cart_item', as: :cart_item
