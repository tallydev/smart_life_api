class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.string :seq
    	t.integer :state
    	t.string :pay_way
    	t.float :price
      t.integer :contact_id
      t.references :user

      t.timestamps null: false
    end
  end
end
