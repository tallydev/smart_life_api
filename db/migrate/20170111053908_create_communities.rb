class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name
      t.references :subdistrict, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
