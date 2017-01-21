# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  title           :string(191)
#  price           :float(24)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  count           :integer
#  detail          :text(65535)
#  state           :integer
#  classify_id     :integer
#  product_sort_id :integer
#  after_discount  :float(24)
#  expiration_time :datetime
#  product_type    :integer          default(0)
#  subdistrict_id  :integer          default(1)
#
# Indexes
#
#  fk_rails_4f43a87044            (subdistrict_id)
#  fk_rails_8c0953ced4            (product_sort_id)
#  index_products_on_classify_id  (classify_id)
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
