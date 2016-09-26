# == Schema Information
#
# Table name: sports
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  date       :date
#  count      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sports_on_date     (date)
#  index_sports_on_user_id  (user_id)
#

class Sport < ActiveRecord::Base
  belongs_to :user

  before_save :cal_relations

  by_star_field :date

  scope :filter_date, ->(date) { where(date: date) }

  validates_uniqueness_of :date, scope: :user_id
  validate :count_validate

  def tag
    date.to_s
  end

  def rank
    self.class.where(date: date).where("count > :count", count: count).count + 1
  end

  private

    def count_validate
      increase = self.count.to_i - self.count_was.to_i
      if increase < 0
        self.errors.add(:count, "运动步数不能比原来少")
      elsif increase > 60000
        self.errors.add(:count, "一天的运动步数过多")
      end
    end

    def cal_relations
      increase = self.count.to_i - self.count_was.to_i
      logger.info "=============user is:#{self.user.phone}, increase is: #{increase}==================="
      if increase > 0
        cal_weekly increase
        cal_monthly increase
        cal_yearly increase
      end
    end

    def cal_weekly increase
      year = self.date.year
      cweek = self.date.cweek
      sport = Sport::Weekly.where(user: self.user, year: year, cweek: cweek).first_or_initialize
      sport.increment :count, increase
      sport.save
    end

    def cal_monthly increase
      year = self.date.year
      month = self.date.month
      sport = Sport::Monthly.where(user: self.user, year: year, month: month).first_or_initialize
      sport.increment :count, increase
      sport.save
    end

    def cal_yearly increase
      year = self.date.year
      sport = Sport::Yearly.where(user: self.user, year: year).first_or_initialize
      sport.increment :count, increase
      sport.save
    end
end
