class CreateSportMonthlies < ActiveRecord::Migration
  def change
    create_table :sport_monthlies do |t|
      t.references :user, index: true
      t.integer :count
      t.integer :year
      t.integer :month

      t.timestamps null: false
    end
  end
end
