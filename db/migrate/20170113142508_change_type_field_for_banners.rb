class ChangeTypeFieldForBanners < ActiveRecord::Migration
  def change
  	rename_column :banners, :type, :banner_type
  end
end
