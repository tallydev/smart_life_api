# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  title      :string
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  count      :integer
#  detail     :text
#  state      :integer
#

FactoryGirl.define do
  factory :product do
    title "product title"
    price 1.5
    count 10
    after(:build) do |product|
    	product.product_banners << FactoryGirl.create(:product_banner)
  	end
    association :product_cover, factory: :image, photo_type: "product_cover"
    # after(:build) do |product, eval|
    #  	product.thumbs << FactoryGirl.create(:image, imageable_id: product.id, photo_type: 'thumb')
    #  	product.thumbs << FactoryGirl.create(:image, imageable_id: product.id, photo_type: 'thumb')
  	# end
  end
end
