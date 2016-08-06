# == Schema Information
#
# Table name: examinations
#
#  id           :integer          not null, primary key
#  user_info_id :integer
#  date         :date
#  sbp          :float
#  dbp          :float
#  pulse        :float
#  bo           :float
#  fetalheart   :float
#  glu          :float
#  chol         :float
#  ua           :float
#  fat          :float
#  bmr          :float
#  water        :float
#  height       :float
#  weight       :float
#  bmi          :float
#  waistline    :float
#  hipline      :float
#  whr          :float
#  bmd_t        :float
#  bmd_z        :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  type         :string
#
# Indexes
#
#  index_examinations_on_date          (date)
#  index_examinations_on_user_info_id  (user_info_id)
#

# 单次记录
class Exam::Record < Examination
  before_save :update_exam_report

  scope :filter, ->(item) { where.not(item => nil) }
  scope :date_asc, -> { order(date: :asc) }
  scope :date_desc, -> { order(date: :desc) }

  private
    def update_exam_report
      exam_report = user_info.exam_report || user_info.build_exam_report
      change_attributes = self.changes
      change_attributes.each do |name, values|
        next if ["type", "user_info_id"].include?(name)
        exam_report.send :write_attribute, name, values[-1]
      end
      exam_report.save
    end
end
