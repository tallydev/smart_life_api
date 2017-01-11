class AddProductTypeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :product_type, :integer, default: 0
  end
end
