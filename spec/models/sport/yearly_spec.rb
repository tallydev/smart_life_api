# == Schema Information
#
# Table name: sport_yearlies
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  count          :integer
#  year           :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer
#
# Indexes
#
#  index_sport_yearlies_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Sport::Yearly, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
