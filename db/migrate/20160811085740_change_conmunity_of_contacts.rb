class ChangeConmunityOfContacts < ActiveRecord::Migration
  def change
  	rename_column :contacts, :conmunity, :community
  end
end
