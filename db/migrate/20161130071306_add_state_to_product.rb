class AddStateToProduct < ActiveRecord::Migration
  def change
    add_column :products, :state, :integer
  end
end
