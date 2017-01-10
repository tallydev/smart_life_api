class AddPostageToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :postage, :float
  end
end
