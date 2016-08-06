class HealthyService::Code1012
  def process params
    response = {}
    user_info = UserInfo.find_by(identity_card: params["cardNo"])
    if user_info.present?
      date = Time.zone.today
      
      exam_record = user_info.exam_records.where(date: date).first_or_initialize
      exam_record.waistline = params["waistline"]
      exam_record.hipline = params["hipline"]
      exam_record.whr = params["whr"]
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