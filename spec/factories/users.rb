# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(191)      default(""), not null
#  encrypted_password     :string(191)      default(""), not null
#  reset_password_token   :string(191)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(191)
#  last_sign_in_ip        :string(191)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  authentication_token   :string(30)
#  phone                  :string(191)
#  subdistrict_id         :integer
#
# Indexes
#
#  fk_rails_30f1da5737                  (subdistrict_id)
#  index_users_on_authentication_token  (authentication_token) UNIQUE
#  index_users_on_phone                 (phone) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryGirl.define do
  factory :user do
    phone "13813813811"
    password "abcd.1234"
    sms_token "1981"
    authentication_token "qwertyuiop1"
  end

  factory :user1, class: :user do
    phone "13813813812"
    password "abcd.1234"
    sms_token "1981"
    authentication_token "qwertyuiop2"
  end  
end
