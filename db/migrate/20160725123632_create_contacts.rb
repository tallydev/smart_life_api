class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :user, index: true
      t.string :name
      t.string :phone
      t.string :conmunity
      t.string :address
      t.boolean :is_default

      t.timestamps null: false
    end
  end
end
