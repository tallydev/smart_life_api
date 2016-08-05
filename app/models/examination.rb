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
