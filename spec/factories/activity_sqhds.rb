# == Schema Information
#
# Table name: activity_sqhds
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :activity_sqhd, class: 'Activity::Sqhd' do
    title "MyString"
  end
end
