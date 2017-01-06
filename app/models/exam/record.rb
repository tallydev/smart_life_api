# == Schema Information
#
# Table name: examinations
#
#  id           :integer          not null, primary key
#  user_info_id :integer
#  date         :date
#  sbp          :float(24)
#  dbp          :float(24)
#  pulse        :float(24)
#  bo           :float(24)
#  fetalheart   :float(24)
#  glu          :float(24)
#  chol         :float(24)
#  ua           :float(24)
#  fat          :float(24)
#  bmr          :float(24)
#  water        :float(24)
#  height       :float(24)
#  weight       :float(24)
#  bmi          :float(24)
#  waistline    :float(24)
#  hipline      :float(24)
#  whr          :float(24)
#  bmd_t        :float(24)
#  bmd_z        :float(24)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  type         :string(191)
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
