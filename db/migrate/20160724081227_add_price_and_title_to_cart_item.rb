class AddPriceAndTitleToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :price, :float
    add_column :cart_items, :title, :string
  end
end
