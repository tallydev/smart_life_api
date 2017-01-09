class AddCommunityToUserInfo < ActiveRecord::Migration
  def change
    add_column :user_infos, :community, :string
  end
end
