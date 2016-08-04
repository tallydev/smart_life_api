class AddStateToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :state, :integer
  end
end
