# == Schema Information
#
# Table name: sport_weeklies
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  count          :integer
#  year           :integer
#  cweek          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer
#
# Indexes
#
#  index_sport_weeklies_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :sport_weekly, class: 'Sport::Weekly' do
    user nil
    count 1
    year 1
    cweek 1
  end
end
