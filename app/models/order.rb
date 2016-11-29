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
	belongs_to :user
	has_many :cart_items

	before_save :cal_price
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
      transitions from: :unpaid, to: :rpaid
    end

    event :cancel do
      transitions from: :unpaid, to: :canceled
    end
  end

  def state_alias
    I18n.t :"order.#{state}"
  end

  def set_cart_items ids
  	CartItem.in_ids(ids).each do |cart_item|
      cart_item.order = self
      cart_item.unpaid! #从购物车中消失
      cart_item.save!
    end
  end

  def set_disable_if_necessary
  	self.cart_items.each {|cart_item| cart_item.set_disable_if_necessary}
  	self.disable! if self.cart_items.state_is("disable").any?
  end


  private 
  	def set_seq
  		self.seq = "#{Time.zone.now.strftime('%Y%m%d')}#{id.to_s.rjust(6, '0')}"
  	end

  	def cal_price
  		_sum = 0.00
  		self.cart_items.each {|cart_item| _sum += cart_item.amount}
  		self.price = _sum
  	end



end
