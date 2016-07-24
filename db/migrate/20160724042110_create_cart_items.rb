class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.references :product, index: true
      t.references :user, index: true
      t.integer :count
      t.float :amount
      t.integer :state

      t.timestamps null: false
    end
  end
end
