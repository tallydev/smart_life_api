# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  title           :string
#  price           :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  count           :integer
#  detail          :text
#  state           :integer
#  product_sort_id :integer
#

class Product < ActiveRecord::Base

	include AASM
  
  has_one :product_cover, -> { where photo_type: "product_cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :product_cover, allow_destroy: true
  has_one :product_detail, -> { where photo_type: "product_detail" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :product_detail, allow_destroy: true
 
  has_many :product_banners
  belongs_to :product_sort

  validates_presence_of :price, on: :create, message: "商品价格不能为空"
  validates_numericality_of :price, greater_than: 0
  # validate :right_product_sort_title?

  # before_save :set_product_sort_id

  scope :state_is, -> (state) {where(state: state)}
  scope :for_sale, -> {where(state: "for_sale")}
  scope :sort_is, -> (sort) {where(sort: sort)}
  enum state: {
    for_sale: 0,
    sale_off: 1,
  }

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

  def sort
  #定义方法 activeadmin中可以使用为 f.input :sort
    self.product_sort.try(:title)
  end

  private
    # def set_product_sort_id
    #   _product_sort = ProductSort.title_is(self.sort).try(:first)
    #   self.product_sort_id =  _product_sort ?  _product_sort.id : nil
    # end

    # def right_product_sort_title?
    #   unless self.sort == nil || ProductSort.title_is(self.sort).any?
    #     errors.add(:sort, "商品分类名称错误")
    #   end
    # end
end
