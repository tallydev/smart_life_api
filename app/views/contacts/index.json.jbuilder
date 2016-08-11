@contacts.first.update( is_default: true )
json.contacts(@contacts) do |contact|
  json.extract! contact, :id, :name, :phone, :area, :street, :conmunity, :address, :is_default, :order
  json.is_default contact.is_default || false
end
