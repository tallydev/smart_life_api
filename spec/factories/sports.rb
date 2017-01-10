# == Schema Information
#
# Table name: sports
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  date           :date
#  count          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  platform       :string(191)
#  version        :integer
#  subdistrict_id :integer
#
# Indexes
#
#  fk_rails_4416303325      (subdistrict_id)
#  index_sports_on_date     (date)
#  index_sports_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :sport do
    user nil
    date "2016-06-25"
    count 1
    platform "ios"
    version 10
  end
end
