class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.references :news_sort, index: true, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
