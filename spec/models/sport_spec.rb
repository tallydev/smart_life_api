# == Schema Information
#
# Table name: sports
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  date       :date
#  count      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  platform   :string(191)
#  version    :integer
#
# Indexes
#
#  index_sports_on_date     (date)
#  index_sports_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Sport, type: :model do
  it { should belong_to(:user) } 
end
