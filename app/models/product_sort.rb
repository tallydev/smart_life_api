# == Schema Information
#
# Table name: product_sorts
#
#  id             :integer          not null, primary key
#  title          :string(191)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer          default(1)
#
# Indexes
#
#  fk_rails_33238a7e68  (subdistrict_id)
#

class ProductSort < ActiveRecord::Base
	has_many :products
	has_one :product_sort_icon, -> { where photo_type: "product_sort_icon" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :product_sort_icon, allow_destroy: true

  belongs_to :subdistrict
  scope :subdistrict_is, ->(subdistrict_id){where(subdistrict_id: subdistrict_id)}
  
  validates_presence_of :title, message: "分类名称不能为空"
  # validates_uniqueness_of :title, message: "分类名称不能重复"

  scope :title_is, ->(title) {where(title: title)}
end
