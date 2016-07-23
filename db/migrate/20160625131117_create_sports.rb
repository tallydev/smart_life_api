class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.references :user, index: true, foreign_key: true
      t.date :date
      t.integer :count

      t.timestamps null: false
    end
    add_index :sports, :date
  end
end
