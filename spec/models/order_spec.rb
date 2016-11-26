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

require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
