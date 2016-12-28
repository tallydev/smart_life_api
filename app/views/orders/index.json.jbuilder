json.current_page @orders.current_page
json.total_pages @orders.total_pages
json.orders @orders, partial: 'orders/order', as: :order
