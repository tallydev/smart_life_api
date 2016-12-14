class AddMetadataToPingRequest < ActiveRecord::Migration
  def change
    add_column :ping_requests, :metadata, :string
  end
end
