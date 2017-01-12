class AddProvinceAndCityToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :province, :string
    add_column :contacts, :city, :string
  end
end
