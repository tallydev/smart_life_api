class AddRefereneceBetweenOrderAndPingRequest < ActiveRecord::Migration
  def change
  	add_reference :ping_requests, :order, foreign_key: true
  end
end
