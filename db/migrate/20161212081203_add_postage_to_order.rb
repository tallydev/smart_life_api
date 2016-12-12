class AddPostageToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :postage, :float, default: 0.00
  end
end
