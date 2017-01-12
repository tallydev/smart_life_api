# == Schema Information
#
# Table name: sport_yearlies
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  count          :integer
#  year           :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer
#
# Indexes
#
#  fk_rails_039bd99631              (subdistrict_id)
#  index_sport_yearlies_on_user_id  (user_id)
#

class Sport::Yearly < ActiveRecord::Base
  belongs_to :user

  scope :filter_date, ->(date) { where(year: date.year) }
  scope :subdistrict_is, ->(subdistrict_id) { where(subdistrict_id: subdistrict_id)}
  
  # validates_uniqueness_of :user_id, scope: :year

  before_save :output_log

  def output_log
    logger.info "=====user yearly increase:#{self.user.phone}, old is:#{self.count_was}, new is:#{self.count}, increase is:#{self.count.to_i - self.count_was.to_i}"
  end

  def rank
    self.class.where(year: year).where("count > :count", count: count).count + 1
  end
end
