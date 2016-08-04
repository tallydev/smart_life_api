# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  count      :integer
#  amount     :float
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  price      :float
#  title      :string
#
# Indexes
#
#  index_cart_items_on_product_id  (product_id)
#  index_cart_items_on_user_id     (user_id)
#

class CartItem < ActiveRecord::Base

  include AASM

  belongs_to :product
  belongs_to :user

  validates_presence_of :user, on: :create, message: "购物车的用户信息不能为空"
  validates_presence_of :product, on: :create, message: "购买的商品不存在"
  validates_presence_of :count, on: :save, message: "请输入购买商品的数量"
  validates_numericality_of :count, greater_than_or_equal_to: 1, message: "购买的商品数量至少为1"

  before_save :add_product_info, only: :create
  before_save :cal_amount

  enum state: {
    unpaid: 1,
    paid: 2,
    canceled: 9
  }

  aasm column: :state, enum: true do
    state :unpaid, initial: true
    state :paid, :canceled

    event :pay do
      transitions from: :unpaid, to: :paid
    end

    event :cancel do
      transitions from: :unpaid, to: :canceled
    end
  end

  def state_alias
    I18n.t :"cart_item_state.#{state}"
  end

  private   

    def add_product_info
      self.price = self.product.price
      self.title = self.product.title
    end

    def cal_amount
      self.amount = self.price.to_f * self.count
    end
end
