# == Schema Information
#
# Table name: sport_yearlies
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  count      :integer
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sport_yearlies_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :sport_yearly, class: 'Sport::Yearly' do
    user nil
    count 1
    year 1
  end
end
