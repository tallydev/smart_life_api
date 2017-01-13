class ChangeBanners < ActiveRecord::Migration
  def change
  	change_table :banners do |t|
  		t.string :type
  		t.integer :type_id
  	end
  end
end
