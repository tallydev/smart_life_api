class AddDeatilAndCountToProduct < ActiveRecord::Migration
  def change
    add_column :products, :count, :integer
    add_column :products, :detail, :text
  end
end
