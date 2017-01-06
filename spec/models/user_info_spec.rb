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
#
# Indexes
#
#  index_user_infos_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe UserInfo, type: :model do
  it { should belong_to(:user) } 
  it { should have_one(:avatar) } 
  it { should have_many(:exam_records) } 
  it { should have_one(:exam_report) } 
end
