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

# 个人最新的一次体检情况
class Exam::Report < Examination
end
