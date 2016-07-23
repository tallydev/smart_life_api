class AddCountToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :count, :integer
  end
end
