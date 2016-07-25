json.contacts(@contacts) do |contact|
  json.extract! contact, :id, :phone, :conmunity, :address, :is_default
end
