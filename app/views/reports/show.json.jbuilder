if @item_info.present?
  json.total_pages @report_items.total_pages
  json.current_page @report_items.current_page

  json.name @item_name
  json.alias @item_info[:alias]
  json.hint @item_info[:hint]

  json.list(@report_items) do |report_item|
    value = report_item.send(@item_name)
    json.date report_item.date
    json.value value
    json.state Exam::Report.item_state(@item_name, value)
  end  
end
