# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  title           :string(191)
#  price           :float(24)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  count           :integer
#  detail          :text(65535)
#  state           :integer
#  classify_id     :integer
#  product_sort_id :integer
#  after_discount  :float(24)
#  expiration_time :datetime
#  product_type    :integer          default(0)
#  subdistrict_id  :integer          default(1)
#
# Indexes
#
#  fk_rails_4f43a87044            (subdistrict_id)
#  fk_rails_8c0953ced4            (product_sort_id)
#  index_products_on_classify_id  (classify_id)
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
