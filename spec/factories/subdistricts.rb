# == Schema Information
#
# Table name: subdistricts
#
#  id             :integer          not null, primary key
#  province       :string(191)
#  city           :string(191)
#  subdistrict    :string(191)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  district       :string(191)
#  property_phone :string(191)
#  alarm_phone    :string(191)
#

FactoryGirl.define do
  factory :subdistrict do
    province "云南省"
    city "昆明市"
		district "五化区"
		subdistrict "红云街道"
  end
end
