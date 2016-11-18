class CreateActivitySqhds < ActiveRecord::Migration
  def change
    create_table :activity_sqhds do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
