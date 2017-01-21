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

FactoryGirl.define do
  factory :examination do
    user_info nil
    date "2016-08-05"
    sbp 1.5
    dbp 1.5
    pulse 1.5
    bo 1.5
    fetalheart 1.5
    glu 1.5
    chol 1.5
    ua 1.5
    fat 1.5
    bmr 1.5
    water 1.5
    height 1.5
    weight 1.5
    bmi 1.5
    waistline 1.5
    hipline 1.5
    whr 1.5
    bmd_t 1.5
    bmd_z 1.5
  end
end
