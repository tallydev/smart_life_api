class AddPhotoTypeToImage < ActiveRecord::Migration
  def change
    add_column :images, :photo_type, :string
  end
end
