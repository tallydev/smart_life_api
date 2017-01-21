class AddReferenceAboutSubdistrict < ActiveRecord::Migration
  def change
  	add_reference :appointments, :subdistrict, foreign_key: true
  	add_reference :products, :subdistrict, foreign_key: true
  	add_reference :activity_sqhds, :subdistrict, foreign_key: true
  	add_reference :banners, :subdistrict, foreign_key: true
  	add_reference :product_sorts, :subdistrict, foreign_key: true
		add_reference :orders, :subdistrict, foreign_key: true
		add_reference :cart_items, :subdistrict, foreign_key: true
  end
end
