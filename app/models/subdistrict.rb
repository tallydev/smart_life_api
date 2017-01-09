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
		"#{province}省 #{city}市 #{subdistrict}街道"
	end

	def self.to_id condition
		# 街道名称 Id
	end
	
	def self.list

	end 
	
end
