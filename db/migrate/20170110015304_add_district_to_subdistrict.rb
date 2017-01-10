class AddDistrictToSubdistrict < ActiveRecord::Migration
  def change
    add_column :subdistricts, :district, :string
  end
end
