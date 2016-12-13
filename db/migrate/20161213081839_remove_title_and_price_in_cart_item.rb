class RemoveTitleAndPriceInCartItem < ActiveRecord::Migration
  def change
  	remove_column :cart_items, :price, :float
  	remove_column :cart_items, :title, :string
  end
end
