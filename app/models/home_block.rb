# == Schema Information
#
# Table name: home_blocks
#
#  id            :integer          not null, primary key
#  admin_user_id :integer
#  title         :string(191)
#  ranking       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_home_blocks_on_admin_user_id  (admin_user_id)
#

class HomeBlock < ActiveRecord::Base
  belongs_to :admin_user

  has_one :home_block_cover, -> { where photo_type: "home_block_cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :home_block_cover, allow_destroy: true

   validates :title, uniqueness: { scope: :admin_user_id,
   	 message: '该模块已存在' }

   default_scope {order('ranking')}
end
