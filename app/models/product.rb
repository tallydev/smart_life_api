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
  has_one :thumb, -> { where photo_type: "thumb" }, class_name: "Image", as: :imageable, dependent: :destroy
end
