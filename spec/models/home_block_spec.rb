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

require 'rails_helper'

RSpec.describe HomeBlock, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
