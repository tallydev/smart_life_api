class AddAreaToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :area, :string
    add_column :contacts, :street, :string
  end
end
