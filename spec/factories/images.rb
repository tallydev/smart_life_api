# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  imageable_id       :integer
#  imageable_type     :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  photo_type         :string(255)
#
# Indexes
#
#  index_images_on_imageable_type_and_imageable_id  (imageable_type,imageable_id)
#

FactoryGirl.define do
  factory :image do
    photo_type "photo type"   
    photo {Rack::Test::UploadedFile.new('./spec/assets/news.png', 'image/png')}
  end
end
