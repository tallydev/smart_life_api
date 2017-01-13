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
#  after_discount  :float
#  expiration_time :datetime
#  product_type    :integer          default(0)
#

class Promotion < Product
	# 限量销售
	default_scope { where( product_type: 1 ) }

	validate :check_expiration_time




	private

	def check_expiration_time
		errors.add(:expiration_time, "到期时间错误") if self.expiration_time &&  self.expiration_time < Time.now
	end
end
