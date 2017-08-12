# == Schema Information
#
# Table name: news_sorts
#
#  id             :integer          not null, primary key
#  rank           :integer
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer
#

FactoryGirl.define do
  factory :news_sort do
    sequence(:rank) { |n| n }
    sequence(:title) { |n| "市区动态#{n}" }
    association :news_sort_cover, factory: :image, photo_type: "news_sort_cover"
  end
end
