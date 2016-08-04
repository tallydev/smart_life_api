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
#
# Indexes
#
#  index_user_infos_on_user_id  (user_id)
#

class UserInfo < ActiveRecord::Base
  enum sex: [:male, :female]

  belongs_to :user
  has_one :avatar, -> { where photo_type: "avatar" }, class_name: "Image", as: :imageable, dependent: :destroy

  delegate :phone, to: :user

  accepts_nested_attributes_for :avatar, allow_destroy: true
end
