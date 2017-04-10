class AddProductTitileToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :product_title, :string
  end
end
