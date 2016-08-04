# == Schema Information
#
# Table name: sport_monthlies
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  count      :integer
#  year       :integer
#  month      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sport_monthlies_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :sport_monthly, class: 'Sport::Monthly' do
    user nil
    count 1
    year 1
    month 1
  end
end
