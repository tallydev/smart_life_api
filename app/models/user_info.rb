# == Schema Information
#
# Table name: user_infos
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  nickname      :string
#  identity_card :string
#  sex           :string
#  integer       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_user_infos_on_user_id  (user_id)
#

class UserInfo < ActiveRecord::Base
  belongs_to :user

  enum sex: [:male, :female]

  delegate :phone, to: :user
end
