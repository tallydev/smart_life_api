class AddExpirationTimeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :expiration_time, :datetime
  end
end
