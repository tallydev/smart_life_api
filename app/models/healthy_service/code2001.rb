class HealthyService::Code2001
  def process params
    response = {}
    user_info = UserInfo.find_by(identity_card: params["cardNo"])
    if user_info.present?
      
    else
      response["errCode"] = 1
      response["errMsg"] = "可以自动建档"
    end
  end
end