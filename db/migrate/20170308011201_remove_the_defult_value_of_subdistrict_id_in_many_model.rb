class RemoveTheDefultValueOfSubdistrictIdInManyModel < ActiveRecord::Migration
  def change
  	change_column :products, :subdistrict_id, :integer
  end
end
