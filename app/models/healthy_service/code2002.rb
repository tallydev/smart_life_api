class HealthyService::Code2002
  def process params
    response = {}
    user_info = UserInfo.find_by(identity_card: params["cardNo"])
    if user_info.present? && user_info.try(:exam_report).present?
      exam_report = user_info.exam_report
      response["errCode"] = 0
      response["errMsg"] = "查询成功"
      response["sbp"] = exam_report.sbp.to_i
      response["dbp"] = exam_report.dbp.to_i
      response["pulse"] = exam_report.pulse.to_i
      response["bo"] = exam_report.bo.to_i
      response["fetalheart"] = exam_report.fetalheart.to_i
      response["glu"] = exam_report.glu
      response["fat"] = exam_report.fat
      response["bmr"] = exam_report.bmr.to_i
      response["water"] = exam_report.water
      response["height"] = exam_report.height
      response["weight"] = exam_report.weight
      response["bmi"] = exam_report.bmi
      response["ua"] = exam_report.ua.to_i
      response["chol"] = exam_report.chol
      response["waistline"] = exam_report.waistline.to_i
      response["hipline"] = exam_report.hipline.to_i
      response["whr"] = exam_report.whr.to_i
      response["bmd_t"] = exam_report.bmd_t.to_i
      response["bmd_z"] = exam_report.bmd_z.to_i
      response["ecg"] = ""
      response["ecgxml"] = ""
    else
      response["errCode"] = -1
      response["errMsg"] = "查询失败"
    end
    response
  end
end