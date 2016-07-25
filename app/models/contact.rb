# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string
#  phone      :string
#  conmunity  :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order      :integer
#
# Indexes
#
#  index_contacts_on_user_id  (user_id)
#

class Contact < ActiveRecord::Base
  belongs_to :user

  include RankedModel
  ranks :order

  attr_accessor :is_default

end
