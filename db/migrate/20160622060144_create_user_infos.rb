class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.references :user, index: true, foreign_key: true
      t.string :nickname
      t.string :identity_card
      t.string :sex
      t.string :integer

      t.timestamps null: false
    end
  end
end
