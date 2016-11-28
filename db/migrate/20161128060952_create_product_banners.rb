class CreateProductBanners < ActiveRecord::Migration
  def change
    create_table :product_banners do |t|
      t.references :product

      t.timestamps null: false
    end
  end
end
