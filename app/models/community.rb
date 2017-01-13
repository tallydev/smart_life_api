# == Schema Information
#
# Table name: communities
#
#  id             :integer          not null, primary key
#  name           :string
#  subdistrict_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_communities_on_subdistrict_id  (subdistrict_id)
#

class Community < ActiveRecord::Base
  belongs_to :subdistrict
end
