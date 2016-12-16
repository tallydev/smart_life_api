json.total_pages @cart_items.total_pages if @cart_items.respond_to? :total_pages
json.current_page @cart_items.current_page if @cart_items.respond_to? :current_page

json.cart_items @cart_items, partial: 'cart_items/cart_item', as: :cart_item
