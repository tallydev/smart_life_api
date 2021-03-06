# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  seq            :string
#  state          :integer
#  pay_way        :string
#  price          :float
#  contact_id     :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  postage        :float            default(0.0)
#  paid_time      :datetime
#  subdistrict_id :integer
#  order_type     :string           default("精品超市")
#  cart_item_info :text
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_many(:cart_items) } 
  it { should belong_to(:user) } 
end
