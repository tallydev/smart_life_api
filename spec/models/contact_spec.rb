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

require 'rails_helper'

RSpec.describe Contact, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
