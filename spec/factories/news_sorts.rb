# == Schema Information
#
# Table name: news_sorts
#
#  id             :integer          not null, primary key
#  rank           :integer
#  title          :string(191)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer
#
# Indexes
#
#  fk_rails_97499036d9  (subdistrict_id)
#

FactoryGirl.define do
  factory :news_sort do
    sequence(:rank) { |n| n }
    sequence(:title) { |n| "市区动态#{n}" }
    association :news_sort_cover, factory: :image, photo_type: "news_sort_cover"
  end
end
