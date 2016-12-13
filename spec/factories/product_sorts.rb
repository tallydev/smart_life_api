# == Schema Information
#
# Table name: product_sorts
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :product_sort do
    sequence(:title) { |n| "休闲食品#{n}" }
    association :product_sort_icon, factory: :image, photo_type: "product_sort_icon"
  end
end
