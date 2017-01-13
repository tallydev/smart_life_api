# == Schema Information
#
# Table name: subdistricts
#
#  id          :integer          not null, primary key
#  province    :string
#  city        :string
#  subdistrict :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  district    :string
#

FactoryGirl.define do
  factory :subdistrict do
    province "云南省"
    city "昆明市"
		district "五化区"
		subdistrict "红云街道"
  end
end
