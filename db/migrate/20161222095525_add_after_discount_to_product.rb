class AddAfterDiscountToProduct < ActiveRecord::Migration
  def change
    add_column :products, :after_discount, :float
  end
end
