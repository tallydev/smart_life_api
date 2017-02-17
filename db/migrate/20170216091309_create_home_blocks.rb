class CreateHomeBlocks < ActiveRecord::Migration
  def change
    create_table :home_blocks do |t|
      t.references :admin_user, index: true, foreign_key: true
      t.string :title
      t.integer :ranking

      t.timestamps null: false
    end
  end
end
