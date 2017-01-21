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
#
# Indexes
#
#  fk_rails_c3a7ece3a4  (subdistrict_id)
#

FactoryGirl.define do
  factory :order do
    
  end
end
