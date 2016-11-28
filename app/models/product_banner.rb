# == Schema Information
#
# Table name: product_banners
#
#  id         :integer          not null, primary key
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductBanner < ActiveRecord::Base
	belongs_to :product
	has_one :thumb, -> { where photo_type: "thumb" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :thumb, allow_destroy: true
end
