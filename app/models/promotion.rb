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
#  product_sort_id :integer
#  after_discount  :float(24)
#  expiration_time :datetime
#  product_type    :integer          default(0)
#
# Indexes
#
#  fk_rails_8c0953ced4  (product_sort_id)
#

class Promotion < Product
	# 限量销售
	scope :get_promotions, -> { Product.unscoped.all.where(product_type: 1) }


	
end
