# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(191)
#  phone      :string(191)
#  community  :string(191)
#  address    :string(191)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  row_order  :integer
#  area       :string(191)
#  street     :string(191)
#  province   :string(191)
#  city       :string(191)
#
# Indexes
#
#  index_contacts_on_user_id  (user_id)
#

class Contact < ActiveRecord::Base
  belongs_to :user

  include RankedModel
  ranks :row_order, with_same: :user_id

  attr_accessor :is_default

  def output
  	"#{province} #{city} #{area} #{street} #{community} #{address}"
  end
end
