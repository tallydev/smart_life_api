# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  count      :integer
#  amount     :float(24)
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#
# Indexes
#
#  index_cart_items_on_order_id    (order_id)
#  index_cart_items_on_product_id  (product_id)
#  index_cart_items_on_user_id     (user_id)
#

class CartItem < ActiveRecord::Base

  include AASM

  belongs_to :product
  belongs_to :user
  belongs_to :order

  validates_presence_of :user, on: :create, message: "购物车的用户信息不能为空"
  validates_presence_of :product, on: :create, message: "购买的商品不存在"
  validates_presence_of :count, on: :save, message: "请输入购买商品的数量"
  validates_numericality_of :count, greater_than_or_equal_to: 1, message: "购买的商品数量至少为1"

  # before_save :add_product_info, only: :create
  before_save :cal_amount

  scope :state_is, -> (state){where(state: state)}
  scope :in_ids, -> (ids){where(id: ids)}
  #"no_stock" 无法查询？
  scope :editing, -> {where(state: [0, 8, 7])}
  scope :product_id_is, -> (product_id){where(product_id: product_id)}
  enum state: {
    shopping: 0,
    unpaid: 1,
    paid: 2,
    no_stocks: 8, #不能以"no_stocks"scope 查询？？？
    canceled: 9,
    sale_off: 7,
  }

  aasm column: :state, enum: true do
    state :shopping, initial: true
    state :unpaid, :paid, :canceled, :no_stocks, :sale_off

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

  delegate :title, :price, :after_discount, :discount_rate, :product_sort, :sales, to: :product, allow_nil: true

  def self.check_stocks cart_items
    cart_items.each do |cart_item|
      cart_item.no_stocks! if cart_item.count > cart_item.product.count && cart_item.state == 'shopping'
      cart_item.shopping! if cart_item.count <= cart_item.product.count && cart_item.state == 'no_stocks'
      # cart_item.sale_off! if cart_item.product.count < 0
    end
  end

  private

    # def add_product_info
    #   self.price = self.product.price
    #   self.title = self.product.title
    # end

    def cal_amount
      self.amount = self.after_discount.to_f * self.count
    end

end
