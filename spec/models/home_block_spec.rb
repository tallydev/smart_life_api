# == Schema Information
#
# Table name: home_blocks
#
#  id             :integer          not null, primary key
#  title          :string(191)
#  ranking        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer
#
# Indexes
#
#  fk_rails_96bf08918a  (subdistrict_id)
#

require 'rails_helper'

RSpec.describe HomeBlock, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
