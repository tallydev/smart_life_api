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
	# province: "1", city: "4", district: "4", subdistrict: "4")

end
