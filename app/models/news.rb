# == Schema Information
#
# Table name: news
#
#  id           :integer          not null, primary key
#  news_sort_id :integer
#  title        :string(191)
#  content      :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_news_on_news_sort_id  (news_sort_id)
#

class News < ActiveRecord::Base
  belongs_to :news_sort
end
