# == Schema Information
#
# Table name: news_sorts
#
#  id         :integer          not null, primary key
#  rank       :integer
#  title      :string(191)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :news_sort do
    sequence(:title) { |n| n }
    sequence(:title) { |n| "市区动态#{n}" }
    association :news_sort_icon, factory: :image, photo_type: "news_sort_icon"
  end
end
