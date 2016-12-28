json.current_page @products.current_page
json.total_pages @products.total_pages
json.product_sorts(@product_sorts) do |product_sort|
  json.extract! product_sort, :id, :title
  json.product_sort_icon image_url product_sort.product_sort_icon.try(:url, :s750)
end
