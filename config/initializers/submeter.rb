#encodint: utf-8  
 
need_submeter = ["Sport"]

need_submeter.each do |class_name|
	# 定义 对应子模型名常量
	Subdistrict.all.each do |subdistrict| 
	  Object.const_set(  
	       "#{class_name}#{subdistrict.id}",   
	        Class.new(class_name.constantize) { self.table_name ="#{class_name.downcase}#{subdistrict.id}s" })    
	end  

	# 为需分表的对应模型  定义所需方法
	class_name.constantize.class_eval do 

		 def self.create_submeter_table subdistrict_id
		  _class = self
		  ActiveRecord::Schema.define do
		    execute("CREATE TABLE #{_class.name.downcase}#{subdistrict_id}s LIKE #{_class.name.downcase}s;")
		  end
		end

		def self.drop_submeter_table subdistrict_id
		  _class = self
		  ActiveRecord::Schema.define do
		    drop_table "#{_class.name.downcase}#{subdistrict_id}s".to_sym 
		  end
		end

		def self.get_const subdistrict_id
		  "#{self.name}#{subdistrict_id}".constantize
		rescue
		  Object.const_set("#{self.name}#{subdistrict_id}", Class.new(self) { self.table_name ="sport#{subdistrict.id}s" })
		end

	end

end
