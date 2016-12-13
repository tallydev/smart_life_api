class AddReferenceBetweenProductAndProductSort < ActiveRecord::Migration
  def change
  	add_reference :products, :product_sort, foreign_key: true
  end
end
