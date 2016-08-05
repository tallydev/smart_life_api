class HealthyService::Code2000
  def process params
    response = {
      "errCode" => 0,
      "errMsg" => "网络通畅"
    }
  end
end