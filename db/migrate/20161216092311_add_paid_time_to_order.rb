class AddPaidTimeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :paid_time, :datetime
  end
end
