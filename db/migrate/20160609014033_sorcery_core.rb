class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone,            :null => false
      t.string :crypted_password
      t.string :salt
      t.integer :is_active, default: 0
      t.timestamps
    end

    add_index :users, :phone, unique: true
  end
end
