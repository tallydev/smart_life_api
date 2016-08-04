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

class Sport::Yearly < ActiveRecord::Base
  belongs_to :user

  scope :filter_date, ->(date) { where(year: date.year) }
end
