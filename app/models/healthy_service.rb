module HealthyService
  def self.dispatch cmd_xml
    # 解析用户的字符串
    doc = Nokogiri::Slop cmd_xml
    nodes = doc.try(:businessdata).try(:children) || []
    clazz = nil
    params = {}
    nodes.each do |node|
      name = node.name
      value = node.text
      if name == "functioncode"
        clazz = self.const_get("Code#{value}")
      else
        params[name] = value
      end
    end

    # 调用对应处理器方法进行处理
    response = {}
    response = clazz.new.process(params) if clazz.present?
    builder = nil
    if response.is_a? Hash  
      # 将response转换为xml格式返回
      builder = Nokogiri::XML::Builder.new(encoding: 'utf-8') do |xml|
        xml.businessdata {
          response.each do |k, v|
            xml.send(k, v)
          end
        }
      end
    else
      builder = response
    end
    builder.to_xml.to_s
  end
end