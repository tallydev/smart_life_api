class AddDiscountRateToProduct < ActiveRecord::Migration
  def change
    add_column :products, :discount_rate, :float, default: 1.00
  end
end
