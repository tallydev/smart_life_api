# == Schema Information
#
# Table name: banners
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :banner do
    title "MyString"
    position 1
  end
end
