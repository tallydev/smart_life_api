# == Schema Information
#
# Table name: subdistricts
#
#  id             :integer          not null, primary key
#  province       :string(191)
#  city           :string(191)
#  subdistrict    :string(191)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  district       :string(191)
#  property_phone :string(191)
#  alarm_phone    :string(191)
#

require 'rails_helper'

RSpec.describe Subdistrict, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
