class AddCartItemInfoToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :cart_item_info, :text
  end
end
