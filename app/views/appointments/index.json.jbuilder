json.total_pages @appointments.total_pages
json.current_page @appointments.current_page

json.appointments(@appointments) do |appointment|
  json.extract! appointment, :id, :idname, :count, :appointment_type, :date, :state, :state_alias, :created_at
  if appointment.aptable.present?
    json.aptable_id appointment.aptable_id
    json.aptable_type appointment.aptable_type
    json.aptable_name appointment.aptable.try(:title)
  end
end
