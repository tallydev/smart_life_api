class AddReferenceBeteweenAdminUserAndSubdistrict < ActiveRecord::Migration
  def change
  	add_reference :admin_users, :subdistrict, foreign_key: true
  end
end
