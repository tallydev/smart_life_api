# == Schema Information
#
# Table name: banners
#
#  id         :integer          not null, primary key
#  title      :string(191)
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :banner do
    title "MyString"
    position 1
    association :banner_cover, factory: :image, photo_type: "banner_cover"
    association :banner_detail, factory: :image, photo_type: "banner_detail"

  end
end
