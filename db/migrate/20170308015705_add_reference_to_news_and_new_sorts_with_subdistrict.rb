class AddReferenceToNewsAndNewSortsWithSubdistrict < ActiveRecord::Migration
  def change
  	add_reference :news, :subdistrict, foreign_key: true
  	add_reference :news_sorts, :subdistrict, foreign_key: true
  end
end
