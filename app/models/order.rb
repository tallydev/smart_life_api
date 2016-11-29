# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  seq        :string
#  state      :integer
#  pay_way    :string
#  price      :float
#  contact_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ActiveRecord::Base

  include AASM
  
	belongs_to :user
	has_many :cart_items

	after_save :cal_price
	after_save :set_seq

	enum state: {
    unpaid: 1,
    paid: 2,
    canceled: 9
  }

	aasm column: :state, enum: true do
		state :unpaid, initial: true
    state :paid, :canceled, :disable

    event :pay do
      transitions from: :unpaid, to: :paid
    end

    event :cancel do
      transitions from: :unpaid, to: :canceled
    end
  end

  def state_alias
    I18n.t :"order.#{state}"
  end

  def its_cart_items
    CartItem.where(order_id: self.id)  
  end

  def self.create_one order_params, ids
  	ActiveRecord::Base.transaction do  
  	  _order = Order.new(order_params)
      _order.save!
      CartItem.in_ids(ids).each do |cart_item|
    		_product = cart_item.product
    		if cart_item.count > cart_item.product.count
  				raise "\"#{cart_item.title}\"库存不足"
  			end
        cart_item.order_id = _order.id
        cart_item.unpaid! #从购物车中消失

        cart_item.save!
      end
      _order.save!
      _order
  	end   

    rescue => error  
      error
  end

  def create_payment 
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

    rescue => error  
      error
  end

  def recover_stocks
  	self.its_cart_items.each do |cart_item|
      cart_item.product.count += cart_item.count
      cart_item.product.save
    end
  end

  private 
  	def set_seq
  		self.seq = "#{Time.zone.now.strftime('%Y%m%d')}#{id.to_s.rjust(6, '0')}"
  	end

  	def cal_price
  		_sum = 0.00
  		self.its_cart_items.each {|cart_item| _sum += cart_item.amount}
  		self.price = _sum
  	end

end
