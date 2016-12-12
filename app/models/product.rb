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
#  state      :integer
#  sort       :integer
#

class Product < ActiveRecord::Base

	include AASM
  
  has_one :product_cover, -> { where photo_type: "product_cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :product_cover, allow_destroy: true
  has_one :product_detail, -> { where photo_type: "product_detail" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :product_detail, allow_destroy: true
 
  has_many :product_banners

  validates_presence_of :price, on: :create, message: "商品价格不能为空"
  validates_numericality_of :price, greater_than: 0

  scope :state_is, -> (state) {where(state: state)}
  scope :for_sale, -> {where(state: "for_sale")}
  scope :sort_is, -> (sort) {where(sort: sort)}
  enum state: {
    for_sale: 0,
    sale_off: 1,
  }

  # enum sort: {
  #   food: 0,
  #   living_good: 1,
  #   best_item: 2,
  # }

  aasm column: :state, enum: true do
    state :for_sale, initial: true
    state :sale_off

    event :sold_out do
      transitions from: :for_sale, to: :sale_off
    end
  end

  def state_alias
    I18n.t :"product_state.#{state}"
  end

  # def sort_alias
  #   I18n.t :"product_sort.#{sort}"
  # end


end
