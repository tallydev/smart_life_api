class HealthyService::Code2004
  def process params
    response = {}
    user_info = UserInfo.find_by(identity_card: params["cardNo"])
    if user_info.present? && user_info.try(:exam_report).present?
      response["errCode"] = 0
      response["errMsg"] = "查询结果"
      response["promptInfo"] = ""
    else
      response["errCode"] = -1
      response["errMsg"] = "查询结果"
      response["promptInfo"] = ""
    end
    response
  end
end