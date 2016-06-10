if @user.errors.present?
  json.errors @user.errors
else
  json.result {
    json.phone @user.phone
    json.salt @user.salt
  }
end
