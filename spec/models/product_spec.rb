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
#  after_discount  :float
#  expiration_time :datetime
#  product_type    :integer          default(0)
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should have_many(:product_banners) } 
end
