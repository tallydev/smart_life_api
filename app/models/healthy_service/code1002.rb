class HealthyService::Code1002
  def process params
    response = {}
    user_info = UserInfo.find_by(identity_card: params["cardNo"])
    if user_info.present? && user_info.try(:exam_report).present?
      date = Time.zone.today
      
      exam_record = user_info.exam_records.where(date: date).first_or_initialize
      exam_record.bo = params["bo"]
      exam_record.save
      response["errCode"] = 0
      response["errMsg"] = "上传成功"
    else
      response["errCode"] = -1
      response["errMsg"] = "上传失败"
    end
    response
  end
end