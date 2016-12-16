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
#  postage    :float            default(0.0)
#

class Order < ActiveRecord::Base

  include AASM
  
	belongs_to :user
	has_many :cart_items

  before_save :cal_price
	after_create :set_seq

	enum state: {
    unpaid: 1,
    paid: 2,
    canceled: 9
  }

	aasm column: :state, enum: true do
		state :unpaid, initial: true
    state :paid, :canceled, :disable

    event :pay do
      transitions from: :unpaid, to: :paid, after: :pay_each_cart_item
    end

    event :cancel do
      transitions from: :unpaid, to: :canceled
    end
  end

  def state_alias
    I18n.t :"order_state.#{state}"
  end

  def need_postage
    self.postage != 0 
  end

  def created_at_output
    self.created_at.strftime("%Y-%m-%d %H:%M:%S")
  end

  def updated_at_output
    self.updated_at.strftime("%Y-%m-%d %H:%M:%S")
  end

  def pay_each_cart_item
    self.its_cart_items.each { |cart_item| cart_item.pay! }
  end

  def its_cart_items
    CartItem.where(order_id: self.id)  
  end

  def self.create_one user_id, ids
  	ActiveRecord::Base.transaction do  
  	  _order = Order.new(user_id: user_id)
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
      p cart_item.product.count 
      p "ssss"
      p cart_item.product.save
      p cart_item.product
    end
  end

  private 
  	def set_seq
      self.update_attributes(seq: "#{Time.zone.now.strftime('%Y%m%d')}#{id.to_s.rjust(6, '0')}")
  	end

  	def cal_price
  		_sum = 0.00
  		self.its_cart_items.each {|cart_item| _sum += cart_item.amount}
      self.postage = _sum < 50 ? 8.00 : 0.00
  		self.price = _sum + self.postage 
  	end

end
