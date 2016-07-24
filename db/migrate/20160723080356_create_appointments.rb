class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :user, index: true
      t.string :idname
      t.string :type

      t.timestamps null: false
    end
  end
end
