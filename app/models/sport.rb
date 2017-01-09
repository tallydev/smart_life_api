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

class Sport < ActiveRecord::Base
  ###### 注: 修改 字段 需 同步修改下方子表定义 ######
  ######     新的迁移需要 同步对子表操作  ##########
  belongs_to :user

  before_save :cal_relations

  by_star_field :date

  scope :filter_date, ->(date) { where(date: date) }

  validates_uniqueness_of :date, scope: :user_id
  validates_presence_of :version
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
      else
        seconds = Time.zone.now - Time.zone.today.midnight
        count_per_second = self.count / seconds
        self.errors.add(:count, "运动的步数太频繁") if count_per_second > 1
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

    begin #分表
      def self.new_table subdistrict_id
        _class = self
        ActiveRecord::Schema.define do
          execute("CREATE TABLE #{_class.name.downcase}#{subdistrict_id}s LIKE #{_class.name.downcase}s;")
        end
      end

      def self.drop_table subdistrict_id
        _class = self
        ActiveRecord::Schema.define do
          drop_table "#{_class.name.downcase}#{subdistrict_id}s".to_sym 
        end
      end

      def self.get_const subdistrict_id
        Object.const_get("#{self.name}#{subdistrict_id}", Class.new(self))
      rescue
        Object.const_set("#{self.name}#{subdistrict_id}", Class.new(self))
      end

    end
end 
