json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :idname, :count, :appointment_type, :date
end
