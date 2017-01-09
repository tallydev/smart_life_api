# == Schema Information
#
# Table name: sport_monthlies
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  count          :integer
#  year           :integer
#  month          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer
#
# Indexes
#
#  fk_rails_a99218879b               (subdistrict_id)
#  index_sport_monthlies_on_user_id  (user_id)
#

class Sport::Monthly < ActiveRecord::Base
  belongs_to :user

  by_star_field :date

  scope :filter_date, ->(date) { where(year: date.year, month: date.month) }
  validates_uniqueness_of :user_id, scope: [:year, :month]

  def tag
    "#{year}-#{month}"
  end

  def rank
    self.class.where(year: year, month: month).where("count > :count", count: count).count + 1
  end

end
