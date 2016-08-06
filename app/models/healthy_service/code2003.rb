class HealthyService::Code2003
  def process params
    response = {}
    user_info = UserInfo.find_by(identity_card: params["cardNo"])
    if user_info.present? && user_info.try(:exam_report).present?
      records = Exam::Record.filter("sbp").filter("dbp").date_asc
      builder = Nokogiri::XML::Builder.new(encoding: 'utf-8') do |xml|
        xml.businessdata {
          xml.errCode 0
          xml.errMsg "查询成功"
          xml.result {
            records.each do |record|
              xml.checkdate(value: record.date.to_s) {
                xml.sbp record.sbp.to_i
                xml.dbp record.dbp.to_i
              }
            end
          }
        }
      end
      response = builder
    else
      response["errCode"] = -1
      response["errMsg"] = "查询失败"
      response["promptInfo"] = ""
    end
    response
  end
end