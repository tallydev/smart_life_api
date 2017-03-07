class CreateNewsSorts < ActiveRecord::Migration
  def change
    create_table :news_sorts do |t|
      t.integer :rank
      t.string :title

      t.timestamps null: false
    end
  end
end
