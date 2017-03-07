# == Schema Information
#
# Table name: news_sorts
#
#  id         :integer          not null, primary key
#  rank       :integer
#  title      :string(191)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe NewsSort, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
