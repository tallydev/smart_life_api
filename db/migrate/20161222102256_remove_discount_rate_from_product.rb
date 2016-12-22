class RemoveDiscountRateFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :discount_rate, :float
  end
end
