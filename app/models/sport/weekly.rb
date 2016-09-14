# == Schema Information
#
# Table name: sport_weeklies
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  count      :integer
#  year       :integer
#  cweek      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sport_weeklies_on_user_id  (user_id)
#

class Sport::Weekly < ActiveRecord::Base
  belongs_to :user

  scope :filter_date, ->(date) { where(year: date.year, cweek: date.cweek) }

  def rank
    self.class.where(year: year, cweek: cweek).where("count > :count", count: count).count + 1
  end
end
