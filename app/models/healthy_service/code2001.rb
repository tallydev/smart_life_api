class HealthyService::Code2001
  def process params
    response = {}
    user_info = UserInfo.find_by(identity_card: params["cardNo"])
    if user_info.present?
      user_info.name ||= params["fullname"]
      user_info.sex ||= params["gender"] == "男" ? "male" : 'female'
      user_info.nation ||= params["nation"]
      user_info.birth ||= params["birthday"]
      user_info.addr ||= params["addr"]
      user_info.save

      response["errCode"] = 0
      response["errMsg"] = "查询成功"
      response["name"] = user_info.name
      response["sex"] = user_info.sex_alias
      response["birthday"] = user_info.birth.to_s
      response["height"] = user_info.exam_report.try(:height)
      response["weight"] = user_info.exam_report.try(:weight)
    else
      response["errCode"] = 1
      response["errMsg"] = "可以自动建档"
    end
    response
  end
end