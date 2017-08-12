# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  title           :string
#  price           :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  count           :integer
#  detail          :text
#  state           :integer
#  product_sort_id :integer
#  after_discount  :float
#  expiration_time :datetime
#  product_type    :integer          default(0)
#  subdistrict_id  :integer
#  initial_sales   :integer          default(0)
#

FactoryGirl.define do
  factory :product do
    title "product title"
    price 1.5
    count 10
    after_discount 1.0

    after(:build) do |product|
    	product.product_banners << FactoryGirl.create(:product_banner)
  	end
    association :product_cover, factory: :image, photo_type: "product_cover"
    association :product_detail, factory: :image, photo_type: "product_detail"
    # after(:build) do |product, eval|
    #  	product.thumbs << FactoryGirl.create(:image, imageable_id: product.id, photo_type: 'thumb')
    #  	product.thumbs << FactoryGirl.create(:image, imageable_id: product.id, photo_type: 'thumb')
  	# end
  end

  factory :promotion do 
    title "promotion title"
    price 1.5
    count 10
    after_discount 1.0

    after(:build) do |promotion|
      promotion.product_banners << FactoryGirl.create(:product_banner)
    end
    association :product_cover, factory: :image, photo_type: "product_cover"
    association :product_detail, factory: :image, photo_type: "product_detail"
    # after(:build) do |product, eval|
    #   product.thumbs << FactoryGirl.create(:image, imageable_id: product.id, photo_type: 'thumb')
    #   product.thumbs << FactoryGirl.create(:image, imageable_id: product.id, photo_type: 'thumb')
    # end
  end
end
