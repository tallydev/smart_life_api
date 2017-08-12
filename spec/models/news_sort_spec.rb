# == Schema Information
#
# Table name: news_sorts
#
#  id             :integer          not null, primary key
#  rank           :integer
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer
#

require 'rails_helper'

RSpec.describe NewsSort, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
