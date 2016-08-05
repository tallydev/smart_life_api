class HealthyService::Code2002
  def process params
    response = {}
    user_info = UserInfo.find_by(identity_card: params["cardNo"])
    if user_info.present? && user_info.try(:exam_report).present?
      exam_report = user_info.exam_report
      response["errCode"] = 0
      response["errMsg"] = "查询成功"
      response["sbp"] = exam_report.sbp
      response["dbp"] = exam_report.dbp
      response["pulse"] = exam_report.pulse
      response["bo"] = exam_report.bo
      response["fetalheart"] = exam_report.fetalheart
      response["glu"] = exam_report.glu
      response["fat"] = exam_report.fat
      response["bmr"] = exam_report.bmr
      response["water"] = exam_report.water
      response["height"] = exam_report.height
      response["weight"] = exam_report.weight
      response["bmi"] = exam_report.bmi
      response["ua"] = exam_report.ua
      response["chol"] = exam_report.chol
      response["waistline"] = exam_report.waistline
      response["hipline"] = exam_report.hipline
      response["whr"] = exam_report.whr
      response["bmd_t"] = exam_report.bmd_t
      response["bmd_z"] = exam_report.bmd_z
      response["ecg"] = ""
      response["ecgxml"] = ""
    else
      response["errCode"] = -1
      response["errMsg"] = "查询失败"
    end
    response
  end
end