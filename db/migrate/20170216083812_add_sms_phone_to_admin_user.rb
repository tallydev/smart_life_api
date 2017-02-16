class AddSmsPhoneToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :sms_phone, :string
  end
end
