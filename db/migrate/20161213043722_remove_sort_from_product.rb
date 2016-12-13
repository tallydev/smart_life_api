class RemoveSortFromProduct < ActiveRecord::Migration
  def change
  	remove_column :products, :sort, :string
  end
end
