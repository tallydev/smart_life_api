class AddAlarmPhoneToSubdistrict < ActiveRecord::Migration
  def change
    add_column :subdistricts, :alarm_phone, :string
  end
end
