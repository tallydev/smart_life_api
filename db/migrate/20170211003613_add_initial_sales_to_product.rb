class AddInitialSalesToProduct < ActiveRecord::Migration
  def change
    add_column :products, :initial_sales, :integer, default: 0
  end
end
