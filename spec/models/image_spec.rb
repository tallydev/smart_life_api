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

require 'rails_helper'

RSpec.describe Image, type: :model do
  it { should belong_to(:imageable) } 
end
