class AddOrderToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :order, :integer
  end
end
