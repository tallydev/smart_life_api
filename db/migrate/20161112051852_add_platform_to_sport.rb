class AddPlatformToSport < ActiveRecord::Migration
  def change
    add_column :sports, :platform, :string
    add_column :sports, :version, :integer
  end
end
