# == Schema Information
#
# Table name: product_sorts
#
#  id             :integer          not null, primary key
#  title          :string(191)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer
#
# Indexes
#
#  fk_rails_33238a7e68  (subdistrict_id)
#

require 'rails_helper'

RSpec.describe ProductSort, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
