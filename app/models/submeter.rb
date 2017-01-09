module Submeter
	def self.new_table subdistrict_id
    _class = self
    ActiveRecord::Schema.define do
      execute("CREATE TABLE #{_class.name.downcase}#{subdistrict_id}s LIKE #{_class.name.downcase}s;")
    end
  end

  def self.drop_table subdistrict_id
    _class = self
    ActiveRecord::Schema.define do
      drop_table "#{_class.name.downcase}#{subdistrict_id}s".to_sym 
    end
  end

  def self.get_submeter subdistrict_id
    Object.const_get("#{self.name}#{subdistrict_id}", Class.new(self))
  rescue
    Object.const_set("#{self.name}#{subdistrict_id}", Class.new(self))
  end
end
