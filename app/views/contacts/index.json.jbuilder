unless @contacts.blank?
	@contacts.first.is_default = true
end
json.contacts(@contacts) do |contact|
	json.partial! "contacts/contact", contact: contact 
  json.is_default contact.is_default || false
end
