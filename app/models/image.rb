# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  title              :string(191)
#  photo_file_name    :string(191)
#  photo_content_type :string(191)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  imageable_id       :integer
#  imageable_type     :string(191)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_type         :string(191)
#
# Indexes
#
#  index_images_on_imageable_type_and_imageable_id  (imageable_type,imageable_id)
#

class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  # paperclip gem
  # has_attached_file :photo, styles: { mini: '48x48>', small: '150x150>', medium: '300x300>', product: '600x600>', large: '1280x1280>', s750: '750x750>' }
  has_attached_file :photo, styles: { mini: '48x48>', medium: '300x300>', s750: '750x>' }

  validates_attachment_presence :photo
  validates_attachment_size     :photo, less_than: 10.megabytes
  validates_attachment_content_type :photo, content_type: /image\/.*\Z/

  def url mode
    photo.present? ? photo.url(mode) : ""
  end
end
