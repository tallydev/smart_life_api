# == Schema Information
#
# Table name: product_banners
#
#  id         :integer          not null, primary key
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :product_banner do
    references ""
  end
end
