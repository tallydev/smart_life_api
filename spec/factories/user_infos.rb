# == Schema Information
#
# Table name: user_infos
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  nickname      :string(191)
#  identity_card :string(191)
#  sex           :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  birth         :date
#  slogan        :string(191)
#  pay_password  :string(191)
#  name          :string(191)
#  nation        :string(191)
#  addr          :string(191)
#  community     :string(191)
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
