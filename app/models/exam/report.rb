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
        unit: "CM",
        advise: {
          high: "",
          low: ""
        }
      },
      weight: {
        alias: "体重",
        min: nil,
        max: nil,
        hint: "KG",
        unit: "KG",
        advise: {
          high: "",
          low: ""
        }
      },
      bmi: {
        alias: "BMI",
        min: 18.5,
        max: 23.9,
        hint: "18.5 -- 23.9kg/m2",
        unit: "kg",
        advise: {
          high: "饮食：控制总能量的摄入；膳食清淡少盐少油；荤素搭配，均衡饮食；尽量采用凉拌、蒸、煮、炖、焖的烹调方式。
运动：加强锻炼，增加能量的消耗，促进脂肪的分解。运动以中等负荷强度，即以心率计110—130次/分，时间持续在30分钟以上，慢走、快跑、自行车、游泳等有氧运动。
生活习惯：三餐定时定量，忌进餐过早或过晚，忌一次性吃太多。",
          low: "饮食：饮食宜荤素搭配，种类多样，不偏食，不挑食。适当增加牛奶、鸡蛋、豆及其制品、鱼虾贝类优质蛋白的摄入。
运动：加强锻炼，提高身体素质，改善神经、血管的调节功能，促进血液循环。每周运动三次以上，每次运动30分钟以上。
生活习惯：建立良好的生活习惯，保持良好的精神状态；保证充足的睡眠。"
        }
      },
      sbp: {
        alias: "收缩压",
        min: 90,
        max: 139,
        hint: "90 -- 139mmHg",
        unit: "mmHg",
        advise: {
          high: "",
          low: ""
        }
      },
      dbp: {
        alias: "舒张压",
        min: 60,
        max: 89,
        hint: "60 -- 89mmHg",
        unit: "mmHg",
        advise: {
          high: "",
          low: ""
        }
      },
      pulse: {
        alias: "脉搏",
        min: 60,
        max: 100,
        hint: "60 -- 100次/分",
        unit: "次/分",
        advise: {
          high: "",
          low: ""
        }
      },
      bo: {
        alias: "血氧饱和度",
        min: 95,
        max: 100,
        hint: "95% -- 100%",
        unit: "%",
        advise: {
          high: "",
          low: ""
        }
      },
      fat: {
        alias: "脂肪率",
        min: 21,
        max: 25,
        hint: "21% -- 25%",
        unit: "%",
        advise: {
          high: "饮食：饮食宜全面均衡，荤素搭配，种类多样，适当增加牛奶、蛋、豆及其制品、鱼虾贝类优质蛋白的摄入。
运动：加强锻炼，提高身体素质改善神经、血管的调节功能，促进血液循环。每周运动3-5次，每次运动30分钟以上。
生活习惯：建立良好的生活习惯，保持良好的精神状态；保证充足的睡眠。",
          low: "饮食：控制总能量的摄入；膳食清淡少盐少油；荤素搭配，均衡饮食；尽量采用凉拌、蒸、煮、炖、焖的烹调方式。
运动：加强锻炼，增加能量的消耗，促进脂肪的分解。运动以中等负荷强度，即以心率计110—130次/分，时间持续在30分钟以上，慢走、快跑、自行车、游泳等有氧运动。 
生活习惯：改变不吃早餐，晚餐过晚，一次性进食过多，进餐速度过快等不良习惯。纠正爱吃零食、甜食和高油脂食品的习惯。"
        }
      },
      bmr: {
        alias: "基础代谢",
        min: 1053,
        max: 1287,
        hint: "1053 -- 1287kcal",
        unit: "kcal",
        advise: {
          high: "基础代谢偏高者多见于甲状腺功能亢进者，坚持药物治疗的同时注意规律作息，规律饮食，增强信心，保持良好的精神状态。
腰臀比偏高
腰臀比偏高会为心脑血管疾病埋下隐患，腹部肥胖更易发生冠心病，中风与糖尿病。建议控制总能量摄入，少食多餐；制定运动计划并坚持执行。",
          low: "基础代谢偏低除手术患者外，常见于营养不良的人，甲减患者，体脂肪含量多者。要注意加强营养，同时注意适当运动。"
        }
      },
      water: {
        alias: "水分含量",
        min: 45,
        max: 60,
        hint: "45% -- 60%",
        unit: "%",
        advise: {
          high: "",
          low: "水分的高低跟脂肪率呈反比，脂肪率越高水分越低，若您的水分偏低请减少脂肪含量。"
        }
      },
      glu: {
        alias: "血糖（空腹）",
        min: 3.9,
        max: 6.1,
        hint: "3.9 -- 6.1mmol/L",
        unit: "mmol/L",
        advise: {
          high: "高血糖是糖尿病的前期，易导致急慢性并发症的发生：如抵抗力下降、肾功能受损、视网膜病变、动脉硬化等。
饮食：严格控制糖分摄入，选择生糖指数低的食物，如杂豆，荞麦、魔芋、苦瓜、海带、柚子、杨桃等。多吃蔬菜，蔬菜中所含的维生素矿物质可以很好的提高机体的抗氧化能力，防止糖尿病并发症。多吃豆类、蔬菜类，其中的膳食纤维可以降低餐后血糖。饮酒不利于血糖的控制，血糖控制不佳时应忌酒。
运动：进行有规律的运动，可以增加胰岛素的敏感性，很好的控制血糖。
生活习惯：在外就餐时控制饮酒；点菜忌点糖醋类油煎油炸类的菜肴。",
          low: ""
        }
      },
      ua: {
        alias: "尿酸",
        min: 89,
        max: 357,
        hint: "89 -- 357ummol/L",
        unit: "ummol/L",
        advise: {
          high: "高尿酸是痛风的前提，是进行饮食、运动干预的最佳时期。
饮食：充足的液体有利于尿酸的溶解，预防尿酸性肾结石的发生，每天饮水达到2000毫升以上（500毫升矿泉水4瓶以上），为防止夜尿浓缩，夜间亦补充水分。大部分高尿酸患者尿液的PH值较低，尿酸排出量较高，易出现肾结石。选择高钾低钠的食物如赤豆、丝瓜、芹菜、冬菇、竹笋等可促进尿酸盐的溶解和排泄，但是要选择少油少盐的烹调方式，忌用高温油炸油煎。痛风者多伴有高血压，不吃咸菜、榨菜、火腿、腌制熏烤类食物，忌饮酒。
运动：超重或肥胖者合并痛风的，防止减肥过猛及剧烈运动，以免引发机体发生大量酮体，酮体与尿酸竞争排出，导致高血尿酸，引发痛风急性发作。
生活习惯：一次性吃太多米面类食物、肉类或不按时吃饭造成饥饿会引发痛风急性发作。火锅中的涮烫及禽肉、海鲜的浓汤都含有较高的嘌呤物质不应该喝这样的浓汤。",
          low: ""
        }
      },
      chol: {
        alias: "总胆固醇",
        min: nil,
        max: 5.18,
        hint: "小于5.18mmol/L",
        unit: "mmol/L",
        advise: {
          high: "饮食：控制食物总量，适量多吃新鲜果蔬和粗杂粮；减少糖和盐的摄入；限制饮酒；忌吃动物内脏、鱿鱼等高胆固醇食物。
运动：运动可增加脂质转换，降低胆固醇和低密度脂蛋白胆固醇，升高高密度脂蛋白胆固醇；可调整身体脂肪分布，减少内脏器官周围脂肪的储藏量。
生活习惯：不暴饮暴食，每餐吃七八分饱；荤素比例是1:3,，减少烹调用油量；坚持运动；保持良好的精神状态。",
          low: ""
        }
      },
      waistline: {
        alias: "腰围",
        min: nil,
        max: nil,
        hint: "CM",
        unit: "CM",
        advise: {
          high: "",
          low: ""
        }
      },
      hipline: {
        alias: "臀围",
        min: nil,
        max: nil,
        hint: "CM",
        unit: "CM",
        advise: {
          high: "",
          low: ""
        }
      },
      whr: {
        alias: "腰臀比",
        min: nil,
        max: 0.85,
        hint: "小于0.85",
        unit: "",
        advise: {
          high: "",
          low: ""
        }
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

  def self.advise name, state
    
  end
end
