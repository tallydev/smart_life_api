class AddOrderTypeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order_type, :string, default: "精品超市"
  end
end
