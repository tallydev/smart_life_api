# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  title      :string
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ActiveRecord::Base
end
