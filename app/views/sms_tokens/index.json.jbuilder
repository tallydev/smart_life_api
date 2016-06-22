json.array!(@sms_tokens) do |sms_token|
  json.extract! sms_token, :id
  json.url sms_token_url(sms_token, format: :json)
end
