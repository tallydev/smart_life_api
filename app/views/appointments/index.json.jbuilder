json.total_pages @appointments.total_pages
json.current_page @appointments.current_page

json.appointments(@appointments) do |appointment|
  json.extract! appointment, :id, :idname, :count, :appointment_type, :date, :state, :state_alias
end
