# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  title      :string
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  count      :integer
#  detail     :text
#

FactoryGirl.define do
  factory :product do
    title "product title"
    price 1.5
    association :thumb, factory: :image, photo_type: "thumb"
  end
end
