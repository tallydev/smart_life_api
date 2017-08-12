# == Schema Information
#
# Table name: activity_sqhds
#
#  id             :integer          not null, primary key
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer          default(1)
#

require 'rails_helper'

RSpec.describe Activity::Sqhd, type: :model do
  it { should have_one(:image) } 
  it { should have_one(:detail_image) }
  it { should have_many(:appointments) } 
end
