class CreateSportYearlies < ActiveRecord::Migration
  def change
    create_table :sport_yearlies do |t|
      t.references :user, index: true
      t.integer :count
      t.integer :year

      t.timestamps null: false
    end
  end
end
