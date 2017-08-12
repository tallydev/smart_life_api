# == Schema Information
#
# Table name: communities
#
#  id             :integer          not null, primary key
#  name           :string
#  subdistrict_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_communities_on_subdistrict_id  (subdistrict_id)
#

require 'rails_helper'

RSpec.describe Community, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
