class AddForeignKeyBetweenCartItemAndOrder < ActiveRecord::Migration
  def change
  	remove_reference :cart_items, :order
  	add_reference :cart_items, :order, index: true
  end
end
