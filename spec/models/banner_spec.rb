# == Schema Information
#
# Table name: banners
#
#  id          :integer          not null, primary key
#  title       :string
#  position    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  banner_type :string
#  type_id     :integer
#

require 'rails_helper'

RSpec.describe Banner, type: :model do

end
