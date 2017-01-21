class AddDefaultToSubdistrictId < ActiveRecord::Migration
  def change
  	change_column :appointments, :subdistrict_id, :integer, default: 1
  	change_column :products, :subdistrict_id, :integer, default: 1
  	change_column :activity_sqhds, :subdistrict_id, :integer, default: 1
  	change_column :banners, :subdistrict_id, :integer, default: 1
  	change_column :product_sorts, :subdistrict_id, :integer, default: 1
		change_column :orders, :subdistrict_id, :integer, default: 1
		change_column :cart_items, :subdistrict_id, :integer, default: 1
  end
end
