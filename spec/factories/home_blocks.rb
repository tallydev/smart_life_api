# == Schema Information
#
# Table name: home_blocks
#
#  id             :integer          not null, primary key
#  title          :string(191)
#  ranking        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer
#
# Indexes
#
#  fk_rails_96bf08918a  (subdistrict_id)
#

FactoryGirl.define do
  factory :home_block do
  	title_ary = ['智慧健康', '健步达人', '智慧家居', '社区活动', '社区IT', '上门服务', '精品超市', '限量发售'] 
  	sequence(:title, 0) { |n| title_ary[n] }
  	sequence(:ranking) { |n| n }
    association :home_block_cover, factory: :image, photo_type: "home_block_cover"
  end
end
