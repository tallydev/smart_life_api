# == Schema Information
#
# Table name: banners
#
#  id             :integer          not null, primary key
#  title          :string(191)
#  position       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer          default(1)
#  banner_type    :string(191)
#  type_id        :integer
#
# Indexes
#
#  fk_rails_7d50a4c40b  (subdistrict_id)
#

require 'rails_helper'

RSpec.describe Banner, type: :model do

end
