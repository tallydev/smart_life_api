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

class NewsSort < ActiveRecord::Base
	has_many :news

	has_one :news_sort_cover, -> { where photo_type: "news_sort_cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :news_sort_cover, allow_destroy: true

  default_scope {order(:rank)}
  scope :title_is, -> (title) { where(title: title)}

end
