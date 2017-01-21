# == Schema Information
#
# Table name: banners
#
#  id             :integer          not null, primary key
#  title          :string(191)
#  position       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer          default(1)
#  banner_type    :string(191)
#  type_id        :integer
#
# Indexes
#
#  fk_rails_7d50a4c40b  (subdistrict_id)
#

class Banner < ActiveRecord::Base
	default_scope {order("position")}
	
  has_one :banner_cover, -> { where photo_type: "banner_cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :banner_cover, allow_destroy: true
  has_one :banner_detail, -> { where photo_type: "banner_detail" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :banner_detail, allow_destroy: true
  
  belongs_to :subdistrict
  scope :subdistrict_is, ->(subdistrict_id){where(subdistrict_id: subdistrict_id)}
end
