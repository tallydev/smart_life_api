class AddSortToProduct < ActiveRecord::Migration
  def change
    add_column :products, :sort, :string
  end
end
