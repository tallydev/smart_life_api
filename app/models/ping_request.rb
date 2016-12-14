# == Schema Information
#
# Table name: ping_requests
#
#  id          :integer          not null, primary key
#  object_type :string
#  ping_id     :string
#  complete    :boolean
#  amount      :integer
#  subject     :string
#  body        :string
#  client_ip   :string
#  extra       :string
#  order_no    :string
#  channel     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  order_id    :integer
#  metadata    :string
#

class PingRequest < ActiveRecord::Base
	belongs_to :order 
	
	def get_pay_order  extra
	  Pingpp::Charge.create(
                          :order_no  => self.order_no,
                          :app       => { :id => APP_ID },
                          :channel   => self.channel, #'wx_pub',
                          :amount    => self.amount,
                          :client_ip => self.client_ip, #Pingplusplus.new.get_client_id,
                          :currency  => "cny",
                          :subject   => self.subject,
                          :body      => self.body,
                          :extra     => extra, #直接从数据库去除的是一个字符串 需要解成 hash
                          :metadata  => self.metadata ? JSON.parse(self.metadata) : {}
                           ) 
	end

  def self.create_order_no #order_no 允许重复
    chars =  ('1'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a
    Array.new(8).collect{chars[rand(chars.size - 1)]}.join 
  end

  def self.get_pay_order order, pay_way

		_extra = {}
		# case pay_way
		# when 'wx_pub'
		# 	#ping++ 平台发起创建时  openid 需要下划线 open_id
		# 	_extra = {open_id: params[:openid]}
		# end

		@ping_request = PingRequest.new(
			order_no: PingRequest.create_order_no,
			channel: pay_way,
			client_ip: request.remote_ip,
			extra: _extra,
			amount: order.price.round(2) * 100,
			subject: order.seq,
			body: order.its_cart_items.collect(&:title).join(","),
			openid: params[:openid],#?
      metadata: params[:metadata]#?
			)

		#在ping++平台创建一条记录
		_charge = @ping_request.get_pay_order(_extra) 

		if _charge 
			@ping_request.ping_id = _charge[:id]
			@ping_request.save
		  return _charge 
		end

		rescue Pingpp::PingppError => error
              logger.error 'ping++平台创建订单失败'
              logger.error error.http_body
    					return error unless error.nil?
  	
  end

end
