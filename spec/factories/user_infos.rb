# == Schema Information
#
# Table name: user_infos
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  nickname      :string
#  identity_card :string
#  sex           :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  birth         :date
#  slogan        :string
#  pay_password  :string
#  name          :string
#  nation        :string
#  addr          :string
#
# Indexes
#
#  index_user_infos_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :user_info do
    nickname "my nickname"
    identity_card "my identity card"
    sex 1
    birth "1988-5-26"
    slogan "my slogan"
    pay_password "123456"
    association :avatar, factory: :image, photo_type: "avatar"
  end
end
