json.total_pages @products.total_pages
json.current_page @products.current_page

json.products @products, partial: 'products/product', as: :product