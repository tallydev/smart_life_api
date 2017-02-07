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
#  subdistrict_id :integer          default(1)
#  order_type     :string(191)      default("精品超市")
#  cart_item_info :text(65535)
#
# Indexes
#
#  fk_rails_c3a7ece3a4  (subdistrict_id)
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_many(:cart_items) } 
  it { should belong_to(:user) } 
end
