# == Schema Information
#
# Table name: news_sorts
#
#  id             :integer          not null, primary key
#  rank           :integer
#  title          :string(191)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer
#
# Indexes
#
#  fk_rails_97499036d9  (subdistrict_id)
#

class NewsSort < ActiveRecord::Base
	has_many :news

	has_one :news_sort_cover, -> { where photo_type: "news_sort_cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :news_sort_cover, allow_destroy: true

  default_scope {order(:rank)}

end
