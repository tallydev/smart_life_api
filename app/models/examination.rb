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

# sbp: 收缩压
# dbp: 舒张压
# pulse：脉搏
# bo：血氧
# fetalheart：胎心
# glu：血糖
# chol：胆固醇
# ua：尿酸
# fat：脂肪
# bmr：代谢
# water：水分
# height：身高
# weight：体重
# bmi: bmi值
# waistline: 腰围
# hipline: 臀围
# whr: 腰臀比
# bmd_t：骨密度t值
# bmd_z：骨密度z值
class Examination < ActiveRecord::Base
  belongs_to :user_info
end
