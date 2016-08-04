json.total_pages @cart_items.total_pages if @cart_items.respond_to? :total_pages
json.current_page @cart_items.current_page if @cart_items.respond_to? :current_page

json.cart_items(@cart_items) do |cart_item|
  json.extract! cart_item, :id, :product_id, :amount, :count, :title, :price, :state, :state_alias, :created_at
  json.thumb cart_item.product.try(:thumb).try(:url, :medium)
end
