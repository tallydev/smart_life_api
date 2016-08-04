class CreateSportWeeklies < ActiveRecord::Migration
  def change
    create_table :sport_weeklies do |t|
      t.references :user, index: true
      t.integer :count
      t.integer :year
      t.integer :cweek

      t.timestamps null: false
    end
  end
end
