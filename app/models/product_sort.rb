# == Schema Information
#
# Table name: product_sorts
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductSort < ActiveRecord::Base
	has_many :products
	has_one :product_sort_icon, -> { where photo_type: "product_sort_icon" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :product_sort_icon, allow_destroy: true

  validates_presence_of :title, message: "分类名称不能为空"
  validates_uniqueness_of :title, message: "分类名称不能重复"

  scope :title_is, ->(title) {where(title: title)}
  def sort
  	
  end
end
