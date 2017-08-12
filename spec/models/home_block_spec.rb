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

require 'rails_helper'

RSpec.describe HomeBlock, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
