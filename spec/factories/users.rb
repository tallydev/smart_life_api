# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  phone            :string(255)      not null
#  crypted_password :string(255)
#  salt             :string(255)
#  is_active        :integer          default("0")
#  created_at       :datetime
#  updated_at       :datetime
#
# Indexes
#
#  index_users_on_phone  (phone) UNIQUE
#

FactoryGirl.define do
  factory :user do
    phone '13761964217'
    password 'shtzr840329'
    salt '5cSRctj6cRpFmHDXbRHv'
  end
end
