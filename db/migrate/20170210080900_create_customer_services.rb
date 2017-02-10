class CreateCustomerServices < ActiveRecord::Migration
  def change
    create_table :customer_services do |t|
      t.string :name
      t.string :phone
      t.references :subdistrict, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
