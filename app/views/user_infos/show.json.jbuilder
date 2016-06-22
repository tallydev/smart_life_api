json.extract! @user_info, :id, :phone, :identity_card, :nickname, :created_at, :updated_at
json.avatar image_url @user_info.avatar.try(:url, :medium)
