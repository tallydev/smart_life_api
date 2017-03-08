class RemoveTheDefultValueOfSubdistrictIdInManyModels < ActiveRecord::Migration
  def change
  	change_column_default(:products, :subdistrict_id, nil)
  	change_column_default(:appointments, :subdistrict_id, nil)
  	change_column_default(:cart_items, :subdistrict_id, nil)
  	change_column_default(:orders, :subdistrict_id, nil)
  	change_column_default(:product_sorts, :subdistrict_id, nil)
  	change_column_default(:appointments, :subdistrict_id, nil)
  end
end
