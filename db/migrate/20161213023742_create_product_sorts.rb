class CreateProductSorts < ActiveRecord::Migration
  def change
    create_table :product_sorts do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
