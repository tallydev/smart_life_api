class AddRelationBetweenSubdistrictAndUserAndSport < ActiveRecord::Migration
  def change
  	add_reference :users, :subdistrict, foreign_key: true
  	add_reference :sports, :subdistrict, foreign_key: true
		add_reference :sport_weeklies, :subdistrict, foreign_key: true
		add_reference :sport_monthlies, :subdistrict, foreign_key: true
		add_reference :sport_yearlies, :subdistrict, foreign_key: true
  end
end
