# == Schema Information
#
# Table name: banners
#
#  id             :integer          not null, primary key
#  title          :string(191)
#  position       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer          default(1)
#  banner_type    :string(191)
#  type_id        :integer
#
# Indexes
#
#  fk_rails_7d50a4c40b  (subdistrict_id)
#

FactoryGirl.define do
  factory :banner do
    title "MyString"
    position 1
    association :banner_cover, factory: :image, photo_type: "banner_cover"
    association :banner_detail, factory: :image, photo_type: "banner_detail"

  end
end
