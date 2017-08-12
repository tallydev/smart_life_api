# == Schema Information
#
# Table name: news
#
#  id             :integer          not null, primary key
#  news_sort_id   :integer
#  title          :string
#  content        :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer
#
# Indexes
#
#  index_news_on_news_sort_id  (news_sort_id)
#

require 'rails_helper'

RSpec.describe News, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
