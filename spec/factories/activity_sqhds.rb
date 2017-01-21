# == Schema Information
#
# Table name: activity_sqhds
#
#  id             :integer          not null, primary key
#  title          :string(191)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer          default(1)
#
# Indexes
#
#  fk_rails_0d7048cc4e  (subdistrict_id)
#

FactoryGirl.define do
  factory :activity_sqhd, class: 'Activity::Sqhd' do
    title "Activity sqhd title"
    association :image, factory: :image, photo_type: "image"
    association :detail_image, factory: :image, photo_type: "detail_image"
  end
end
