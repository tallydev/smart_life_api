# == Schema Information
#
# Table name: cart_items
#
#  id             :integer          not null, primary key
#  product_id     :integer
#  user_id        :integer
#  count          :integer
#  amount         :float(24)
#  state          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  order_id       :integer
#  subdistrict_id :integer          default(1)
#
# Indexes
#
#  fk_rails_6d8172cbfc             (subdistrict_id)
#  index_cart_items_on_order_id    (order_id)
#  index_cart_items_on_product_id  (product_id)
#  index_cart_items_on_user_id     (user_id)
#

require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it { should belong_to(:product) } 
  it { should belong_to(:user) } 
end
