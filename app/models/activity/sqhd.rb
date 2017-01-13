# == Schema Information
#
# Table name: activity_sqhds
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Activity::Sqhd < ActiveRecord::Base
  has_one :image, -> { where photo_type: "image" }, class_name: "Image", as: :imageable, dependent: :destroy
  has_one :detail_image, -> { where photo_type: "detail_image" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true
  accepts_nested_attributes_for :detail_image, allow_destroy: true

  has_many :appointments, as: :aptable
end
