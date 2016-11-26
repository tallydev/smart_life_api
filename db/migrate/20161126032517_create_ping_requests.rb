class CreatePingRequests < ActiveRecord::Migration
  def change
    create_table :ping_requests do |t|
    	t.string :object_type
      t.string :ping_id
      t.boolean :complete
      t.integer :amount
      t.string :subject
      t.string :body
      t.string :client_ip
      t.string :extra
      t.string :order_no
      t.string :channel
      
      t.timestamps null: false
    end
  end
end
