# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  seq        :string
#  state      :integer
#  pay_way    :string
#  price      :float
#  contact_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ActiveRecord::Base
	belongs_to :user
	has_many :cart_items
end
