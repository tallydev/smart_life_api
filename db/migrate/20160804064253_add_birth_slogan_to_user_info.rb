class AddBirthSloganToUserInfo < ActiveRecord::Migration
  def change
    add_column :user_infos, :birth, :date
    add_column :user_infos, :slogan, :string
    add_column :user_infos, :pay_password, :string
  end
end
