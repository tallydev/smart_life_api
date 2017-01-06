# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  seq        :string(191)
#  state      :integer
#  pay_way    :string(191)
#  price      :float(24)
#  contact_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  postage    :float(24)        default(0.0)
#  paid_time  :datetime
#

FactoryGirl.define do
  factory :order do
    
  end
end
