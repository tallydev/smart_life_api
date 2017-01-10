json.extract! @user_info, :id, :phone, :sex, :identity_card, :nickname, :birth, :slogan, :created_at, :updated_at, :community
json.subdistrict @user_info.user.subdistrict.try(:name)
json.subdistrict_id @user_info.user.subdistrict.try(:id)
json.avatar image_url @user_info.avatar.try(:url, :medium)
