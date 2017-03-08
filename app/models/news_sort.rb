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

class NewsSort < ActiveRecord::Base
	has_many :news

	has_one :new_sort_cover, -> { where photo_type: "new_sort_cover" }, class_name: "Image", as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :new_sort_cover, allow_destroy: true

end
