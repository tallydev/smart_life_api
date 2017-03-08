class ChangeReferenceInHomeBlockAboutAdminToRelateSubdistrict < ActiveRecord::Migration
  def up
  	remove_reference :home_blocks, :admin_user, foreign_key: true
  	add_reference :home_blocks, :subdistrict, foreign_key: true
  end
  def down
  	add_reference :home_blocks, :admin_user, foreign_key: true
  	remove_reference :home_blocks, :subdistrict, foreign_key: true
  end
end
