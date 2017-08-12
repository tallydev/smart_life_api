# == Schema Information
#
# Table name: activity_sqhds
#
#  id             :integer          not null, primary key
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer          default(1)
#

FactoryGirl.define do
  factory :activity_sqhd, class: 'Activity::Sqhd' do
    title "Activity sqhd title"
    association :image, factory: :image, photo_type: "image"
    association :detail_image, factory: :image, photo_type: "detail_image"
  end
end
