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

FactoryGirl.define do
  factory :news do
    title "我是新闻标题"
    content "我是新闻内容"
    association :news_cover, factory: :image, photo_type: "news_cover"
    association :news_detail, factory: :image, photo_type: "news_detail"
  end
end
