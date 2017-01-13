# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string
#  phone      :string
#  community  :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  row_order  :integer
#  area       :string
#  street     :string
#  province   :string
#  city       :string
#
# Indexes
#
#  index_contacts_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Contact, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
