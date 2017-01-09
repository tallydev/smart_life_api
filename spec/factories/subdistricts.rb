# == Schema Information
#
# Table name: subdistricts
#
#  id          :integer          not null, primary key
#  province    :string(191)
#  city        :string(191)
#  subdistrict :string(191)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :subdistrict do
    name "MyString"
    province "MyString"
    city "MyString"
    subdistrict "MyString"
    community "MyString"
  end
end
