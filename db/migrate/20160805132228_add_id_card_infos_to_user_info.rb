class AddIdCardInfosToUserInfo < ActiveRecord::Migration
  def change
    add_column :user_infos, :name, :string
    add_column :user_infos, :nation, :string
    add_column :user_infos, :addr, :string
  end
end
