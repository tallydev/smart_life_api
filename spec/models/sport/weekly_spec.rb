# == Schema Information
#
# Table name: sport_weeklies
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  count          :integer
#  year           :integer
#  cweek          :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer
#
# Indexes
#
#  fk_rails_239ba97fd8              (subdistrict_id)
#  index_sport_weeklies_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Sport::Weekly, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
