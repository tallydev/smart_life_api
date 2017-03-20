class AddPropertyPhoneToSubdistrict < ActiveRecord::Migration
  def change
    add_column :subdistricts, :property_phone, :string
  end
end
