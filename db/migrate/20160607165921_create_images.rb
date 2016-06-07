class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.attachment :photo
      t.references :imageable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
