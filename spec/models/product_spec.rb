# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  title           :string
#  price           :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  count           :integer
#  detail          :text
#  state           :integer
#  product_sort_id :integer
#  discount_rate   :float            default(1.0)
#  after_discount  :float
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_many(:product_banners) } 
end
