class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :title
      t.integer :position

      t.timestamps null: false
    end
  end
end
