class AddAppointmentableToAppointment < ActiveRecord::Migration
  def change
    add_reference :appointments, :aptable, polymorphic: true, index: true
  end
end
