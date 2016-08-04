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
#  area       :string
#  street     :string
#
# Indexes
#
#  index_contacts_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Contact, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
