# == Schema Information
#
# Table name: home_blocks
#
#  id             :integer          not null, primary key
#  title          :string
#  ranking        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer
#

class HomeBlock < ActiveRecord::Base
  belongs_to :subdistrict

  has_one :home_block_cover, -> { where photo_type: "home_block_cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :home_block_cover, allow_destroy: true

   validates :title, uniqueness: { scope: :subdistrict_id,
   	 message: '该模块已存在' }

   default_scope {order('ranking')}
end
