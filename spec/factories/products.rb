# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  title      :string
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :product do
    title "MyString"
    price 1.5
  end
end
