# == Schema Information
#
# Table name: banners
#
#  id             :integer          not null, primary key
#  title          :string
#  position       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  banner_type    :string
#  type_id        :integer
#  subdistrict_id :integer          default(1)
#

class Banner < ActiveRecord::Base
	default_scope {order("position")}
	
  has_one :banner_cover, -> { where photo_type: "banner_cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :banner_cover, allow_destroy: true
  has_one :banner_detail, -> { where photo_type: "banner_detail" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :banner_detail, allow_destroy: true
  
  belongs_to :subdistrict
  scope :subdistrict_is, ->(subdistrict_id){where(subdistrict_id: subdistrict_id)}
  scope :subdistrict_with_token, ->(token){where(subdistrict_id: token.nil? ? Subdistrict.first.id : User.where(authentication_token: token).first.subdistrict_id)}
end
