class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.references :user, index: true, foreign_key: true
      t.string :nickname
      t.string :identity_card
      t.integer :sex

      t.timestamps null: false
    end
  end
end
