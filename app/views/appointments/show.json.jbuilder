json.extract! @appointment, :id, :appointment_type, :idname, :count, :state, :state_alias, :created_at, :subdistrict_id
if @appointment.aptable.present?
  json.aptable_id @appointment.aptable_id
  json.aptable_type @appointment.aptable_type
  json.aptable_name @appointment.aptable.try(:title)
end