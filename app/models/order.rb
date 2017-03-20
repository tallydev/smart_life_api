# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  seq            :string(191)
#  state          :integer
#  pay_way        :string(191)
#  price          :float(24)
#  contact_id     :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  postage        :float(24)        default(0.0)
#  paid_time      :datetime
#  subdistrict_id :integer
#  order_type     :string(191)      default("精品超市")
#  cart_item_info :text(65535)
#
# Indexes
#
#  fk_rails_c3a7ece3a4  (subdistrict_id)
#

class Order < ActiveRecord::Base

  include AASM
  
	belongs_to :user
	has_many :cart_items, dependent: :destroy
  has_many :ping_requests, dependent: :destroy
  
  belongs_to :subdistrict
  scope :subdistrict_is, ->(subdistrict_id){where(subdistrict_id: subdistrict_id)}
  
  before_save :cal_price
  after_save :set_subdistrict_id
	after_create :set_seq

  default_scope {order("created_at DESC")}
  scope :state_is, -> (state){where(state: state)}

	enum state: {
    unpaid: 1,
    paid: 2,
    shipped: 3,
    canceled: 9
  }

	aasm column: :state, enum: true do
		state :unpaid, initial: true
    state :paid, :canceled, :disable, :shipped

    event :pay do
      transitions from: :unpaid, to: :paid, after: [:pay_each_cart_item, :restore_cart_item_info]
    end

    event :cancel do
      transitions from: :unpaid, to: :canceled
    end
  end
  
  delegate :phone, to: :user, allow_nil: true

  def contact
    self.user.contacts.where(id: self.contact_id).first || self.user.contacts.rank(:row_order).first
  end

  def state_alias
    I18n.t :"order_state.#{state}"
  end

  def pay_way_alias
    pay_way.nil? ? "" : (I18n.t :"pay_way.#{pay_way}" )
  end

  def need_postage
    self.postage != 0 
  end

  def without_postage
    need_postage ? self.price - self.postage : self.price
  end

  def created_at_output
    self.created_at.strftime("%Y-%m-%d %H:%M:%S")
  end

  def updated_at_output
    self.updated_at.strftime("%Y-%m-%d %H:%M:%S")
  end

  def paid_time_output
    self.paid_time.strftime("%Y-%m-%d %H:%M:%S") if self.paid_time
  end

  #####  after pay #######
  def pay_each_cart_item
    _sms_content = "下单人姓名: #{self.user.user_info.nickname}, 电话: #{self.user.phone}, 地址: #{self.contact.output}, 订单详情: "
    self.its_cart_items.each do |cart_item| 
      cart_item.pay!
      _sms_content += "#{cart_item.product.title} * #{cart_item.count}, "
    end
    # 发送通知短信
    _phone = AdminUser.where(subdistrict_id: self.subdistrict_id).first.try(:sms_phone)
    SmsToken.order_message self.seq, _sms_content, _phone
  end
  # id@*@title@*@after_discount@*@price@*@count@;@ ....
  def restore_cart_item_info
    self.cart_item_info = self.cart_items.map { |cart_item| "#{cart_item.id}@*@#{cart_item.title}@*@#{cart_item.after_discount}@*@#{cart_item.price}@*@#{cart_item.count}"}.join("@;@") if self.cart_item_info.nil? || self.cart_item_info.empty? 
    self.save
  end

  ########################
  
  def its_cart_items
    CartItem.where(order_id: self.id)  
  end

  def self.create_one user_id, ids, contact_id, order_type="精品超市"
  	ActiveRecord::Base.transaction do  
  	  _order = Order.new(user_id: user_id, contact_id: contact_id, subdistrict: User.find(user_id).subdistrict)
      _order.save!
      ids = ids.split(",").map {|x| x.to_i } if ids.is_a?(String) #postman 测试时
      CartItem.in_ids(ids).each do |cart_item|
    		_product = cart_item.product
    		if cart_item.count > cart_item.product.count
  				raise "\"#{cart_item.title}\"库存不足"
  			end
        cart_item.order_id = _order.id
        cart_item.unpaid! #从购物车中消失

        cart_item.save!
      end
      _order.order_type = order_type
      _order.save!
      _order
  	end   

    rescue => error  
      error
  end

  def cut_stocks 
    ActiveRecord::Base.transaction do 
      self.its_cart_items.each do |cart_item|
        _product = cart_item.product
        if cart_item.count > cart_item.product.count
          raise "\"#{cart_item.title}\"库存不足"
        end
        #删除库存
        cart_item.product.count -= cart_item.count
        cart_item.product.save!
      end
    end   
    self
    rescue => error  
      error
  end

  def recover_stocks
  	self.its_cart_items.each do |cart_item|
      cart_item.product.count += cart_item.count
    end
  end

  private 
  	def set_seq
      self.update_attributes(seq: "#{Time.zone.now.strftime('%Y%m%d')}#{id.to_s.rjust(6, '0')}")
  	end

  	def cal_price
  		_sum = 0.00
  		self.its_cart_items.each {|cart_item| _sum += cart_item.amount}
      self.postage = _sum < 50 ? (AdminUser.first.postage || 8.00) : 0.00
  		self.price = _sum + self.postage 
  	end

    def set_subdistrict_id
      self.subdistrict_id = self.cart_items.first.subdistrict_id unless self.cart_items.first.nil?
    end

end
