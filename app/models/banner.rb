# == Schema Information
#
# Table name: banners
#
#  id         :integer          not null, primary key
#  title      :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Banner < ActiveRecord::Base
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true
end
