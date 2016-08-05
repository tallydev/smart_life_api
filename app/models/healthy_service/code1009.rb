class HealthyService::Code1009
  def process params
    response = {}

    user = User.find_by(phone: params["phone"]) || User.setup params["phone"]
    user_info = user.info
    user_info.identity_card = params["cardNo"]
    user_info.save

    response["errCode"] = 0
    response["errMsg"] = "上传成功"
    response
  end
end