class CreateSubdistricts < ActiveRecord::Migration
  def change
    create_table :subdistricts do |t|
      t.string :province
      t.string :city
      t.string :subdistrict

      t.timestamps null: false
    end
  end
end
