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

class News < ActiveRecord::Base
  belongs_to :news_sort

  has_one :news_cover, -> { where photo_type: "news_cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :news_cover, allow_destroy: true
  has_one :news_detail, -> { where photo_type: "news_detail" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :news_detail, allow_destroy: true

 	def sort
	  #定义方法 activeadmin中可以使用为 f.input :sort
	  self.news_sort.try(:title)
	end

	def content_replace_image_url 
		content.gsub("src=\"/ckeditor_assets", " src=\"http://220.163.125.158:8081/ckeditor_assets")
	end
end
