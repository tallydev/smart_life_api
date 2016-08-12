unless @contacts.blank?
	@contacts.first.is_default = true
end
json.contacts(@contacts) do |contact|
  json.extract! contact, :id, :name, :phone, :area, :street, :community, :address, :is_default, :order
  json.is_default contact.is_default || false
end
