json.extract! @user_info, :id, :phone, :sex, :identity_card, :nickname, :birth, :slogan, :created_at, :updated_at
json.avatar image_url @user_info.avatar.try(:url, :medium)
