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
    rank 1
    title "MyString"
  end
end
