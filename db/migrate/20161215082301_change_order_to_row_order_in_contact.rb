class ChangeOrderToRowOrderInContact < ActiveRecord::Migration
  def change
  	rename_column :contacts, :order, :row_order
  end
end
