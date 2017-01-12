#encodint: utf-8  
 
NeedSubmeter = ["Sport", "Sport::Weekly", "Sport::Monthly", "Sport::Yearly"]
# Sport::Weekly
NeedSubmeter.each do |class_name|

	# 定义 对应子模型名常量
	Subdistrict.all.each do |subdistrict| 
	  Object.const_set(  
	       "P#{subdistrict.id}#{class_name.delete("::")}",   
	        Class.new(class_name.constantize) { |x| x.table_name ="p#{subdistrict.id}_#{class_name.delete("::").downcase.pluralize}" })    
	end  

	# 为需分表的对应模型  定义所需方法
	class_name.constantize.class_eval do 
		def self.create_submeter_table subdistrict_id
		  _class = self
		  ActiveRecord::Schema.define do
			  execute("CREATE TABLE p#{subdistrict_id}_#{_class.name.downcase.delete("::").pluralize} LIKE #{_class.name.downcase.pluralize.tr_s("::", "_")};")
			end
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
		  "P#{subdistrict_id}#{_class.name.delete("::")}".constantize
		rescue
		  Object.const_set("P#{subdistrict_id}#{_class.name.delete("::")}", Class.new(_class) { |x| x.table_name ="p#{subdistrict_id}_#{self.class.name.delete("::").downcase.pluralize}" })
		end

	end

end
