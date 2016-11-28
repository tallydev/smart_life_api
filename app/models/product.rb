# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  title      :string
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  count      :integer
#  detail     :text
#

class Product < ActiveRecord::Base
  has_one :product_cover, -> { where photo_type: "product_cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :product_cover, allow_destroy: true

  has_many :product_banners

  validates_presence_of :price, on: :create, message: "商品价格不能为空"
  validates_numericality_of :price, greater_than: 0
end
