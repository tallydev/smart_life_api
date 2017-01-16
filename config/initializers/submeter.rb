#encodint: utf-8  
 
NeedSubmeter = ["Sport", "Sport::Weekly", "Sport::Monthly", "Sport::Yearly"]
# Sport::Weekly
NeedSubmeter.each do |class_name| 

	# 为需分表的对应模型  定义所需方法
	class_name.safe_constantize.class_eval do 

		def self.create_submeter_table subdistrict_id
		  _class = self
		  ActiveRecord::Schema.define do
			  execute("CREATE TABLE p#{subdistrict_id}_#{_class.name.downcase.delete("::").pluralize} LIKE #{_class.name.downcase.pluralize.tr_s("::", "_")};")
			  change_column "p#{subdistrict_id}_#{_class.name.downcase.delete("::").pluralize}", :subdistrict_id, :integer, default: subdistrict_id
			end
		rescue => e
			 logger.info "e"
		end

		def self.drop_submeter_table subdistrict_id
		  _class = self
		  ActiveRecord::Schema.define do
		  	# 该代码块 self 指向 ActiveRecord::Schema
		    drop_table "p#{subdistrict_id}_#{_class.name.delete("::").downcase.pluralize}".to_sym 
		  end
		end

		def self.get_const subdistrict_id
			_class = self
		  "P#{subdistrict_id}#{_class.name.delete("::")}".safe_constantize
		rescue
	  	Object.const_set("P#{subdistrict_id}#{_class.name.delete("::")}", Class.new(_class) { |x| x.table_name ="p#{subdistrict_id}_#{self.class.name.delete("::").downcase.pluralize}" })
		end

	end

	# 定义 对应子模型名常量
	Subdistrict.all.each do |subdistrict| 
	  Object.const_set(  
	       "P#{subdistrict.id}#{class_name.delete("::")}",   
	        Class.new(class_name.safe_constantize) { |x| x.table_name ="p#{subdistrict.id}_#{class_name.delete("::").downcase.pluralize}" })    
	  # 数据唯一性验证
	  # 允许数据冗余
	  "P#{subdistrict.id}#{class_name.delete("::")}".safe_constantize.class_eval do 
		  case class_name
		  when "Sport"
				validates_uniqueness_of :date, scope: :user_id
			  validates_presence_of :version
			  validate :count_validate
		  when "Sport::Weekly"
		  	validates_uniqueness_of :user_id, scope: [:year, :cweek]
		  when "Sport::Monthly"
		  	validates_uniqueness_of :user_id, scope: [:year, :month]
		  when "Sport::Yearly"
		  	validates_uniqueness_of :user_id, scope: :year
		  end
		end
	end 
end

# 定义 create_submeter_table 方法后 检查子表

Subdistrict.all.each do |subdistrict| 
	subdistrict.check_submeter_tables
end 
	  
