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

  def self.item_infos
    {
      height: {
        alias: "身高",
        min: nil,
        max: nil,
        hint: "CM",
        unit: "CM"
      },
      weight: {
        alias: "体重",
        min: nil,
        max: nil,
        hint: "KG",
        unit: "KG"
      },
      bmi: {
        alias: "BMI",
        min: 18.5,
        max: 23.9,
        hint: "18.5 -- 23.9kg/m2",
        unit: "kg"
      },
      sbp: {
        alias: "收缩压",
        min: 90,
        max: 139,
        hint: "90 -- 139mmHg",
        unit: "mmHg"
      },
      dbp: {
        alias: "舒张压",
        min: 60,
        max: 89,
        hint: "60 -- 89mmHg",
        unit: "mmHg"
      },
      pulse: {
        alias: "脉搏",
        min: 60,
        max: 100,
        hint: "60 -- 100次/分",
        unit: "次/分"
      },
      bo: {
        alias: "血氧饱和度",
        min: 95,
        max: 100,
        hint: "95% -- 100%",
        unit: "%"
      },
      fat: {
        alias: "脂肪率",
        min: 21,
        max: 25,
        hint: "21% -- 25%",
        unit: "%"
      },
      bmr: {
        alias: "基础代谢",
        min: 1053,
        max: 1287,
        hint: "1053 -- 1287kcal",
        unit: "kcal"
      },
      water: {
        alias: "水分含量",
        min: 45,
        max: 60,
        hint: "45% -- 60%",
        unit: "%"
      },
      glu: {
        alias: "血糖（空腹）",
        min: 3.9,
        max: 6.1,
        hint: "3.9 -- 6.1mmol/L",
        unit: "mmol/L"
      },
      ua: {
        alias: "尿酸",
        min: 0.089,
        max: 0.357,
        hint: "0.089 -- 0.357mmol/L",
        unit: "mmol/L"
      },
      chol: {
        alias: "总胆固醇",
        min: nil,
        max: 5.18,
        hint: "小于5.18mmol/L",
        unit: "mmol/L"
      },
      waistline: {
        alias: "腰围",
        min: nil,
        max: nil,
        hint: "CM",
        unit: "CM"
      },
      hipline: {
        alias: "臀围",
        min: nil,
        max: nil,
        hint: "CM",
        unit: "CM"
      },
      whr: {
        alias: "腰臀比",
        min: nil,
        max: 0.85,
        hint: "小于0.85",
        unit: ""
      }
    }
  end

  def self.item_state name, value
    infos = self.item_infos
    min = infos[name][:min]
    max = infos[name][:max]
    if value.blank?
      "normal"
    elsif min.present? && value.to_f < min.to_f
      "low"
    elsif max.present? && value.to_f > max.to_f
      "high"
    else
      "normal"
    end
  end
end
