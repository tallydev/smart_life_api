# == Schema Information
#
# Table name: subdistricts
#
#  id             :integer          not null, primary key
#  province       :string
#  city           :string
#  subdistrict    :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  district       :string
#  property_phone :string
#  alarm_phone    :string
#

require 'rails_helper'

RSpec.describe Subdistrict, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
