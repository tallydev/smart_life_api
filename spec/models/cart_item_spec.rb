# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  count      :integer
#  amount     :float
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_cart_items_on_product_id  (product_id)
#  index_cart_items_on_user_id     (user_id)
#

require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it { should belong_to(:product) } 
  it { should belong_to(:user) } 
end
