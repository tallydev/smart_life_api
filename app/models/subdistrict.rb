# == Schema Information
#
# Table name: subdistricts
#
#  id          :integer          not null, primary key
#  province    :string(191)
#  city        :string(191)
#  subdistrict :string(191)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  district    :string(191)
#

class Subdistrict < ActiveRecord::Base
	# 社区模型
	# province 省 city 市 subdistrict 街道 
	has_many :users
	# has_many :sports
	# has_many :sport_weeklies
	# has_many :sport_monthlies
	# has_many :sport_yearlies

	def name
		"#{province}#{city}#{district}#{subdistrict}"
	end
	
	def self.list
		_all = Subdistrict.all.to_a
		_all.chunk{ |x| x.province }.map{|province| {province[0] => province[1].chunk{ |x| x.city }.map{|city| {city[0] => city[1].chunk{ |x| x.district  }.map{|district| { district[0] => district[1].map{ |x| { x.subdistrict => x }}}}}}}}
	end 

	def self.list2
		_data = {"province" => Subdistrict.list}
		
		_provinces = Subdistrict.get_son(_data).values[0]
		_cities = _data.values[0].map{|province| Subdistrict.get_son(province)}
		_districts = {}
		_subdistricts = {}
		_data.values[0].each do |province| 
		 	_x = []
		 	province.values[0].each do |city|
		 		_x = Subdistrict.get_son(city)
		 		_districts[_x.keys[0]] = _x.values[0]
		 		_xx = []
		 		city.values[0].each do |district|
		 			_xx = Subdistrict.get_son(district)
		 			_subdistricts[_xx.keys[0]] = _xx.values[0]
	 			end
	 		end
	 	end
	 	{
	 		"provinces" => _provinces,
	 		"citys" => _cities,
	 		"districts" => _districts,
	 		"subdistricts" => _subdistricts
	 	}
	end

	def self.get_son some
		{some.keys[0] => some.values[0].map { |x| x.keys[0]}}
	end


	# province: "1", city: "4", district: "4", subdistrict: "4")

end
