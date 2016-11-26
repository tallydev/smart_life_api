class AddReferenceFromOrderToCartItem < ActiveRecord::Migration
  def change
    add_reference :cart_items, :order
  end
end
