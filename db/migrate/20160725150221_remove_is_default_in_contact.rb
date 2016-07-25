class RemoveIsDefaultInContact < ActiveRecord::Migration
  def change
    change_table :contacts do |t|
      t.remove :is_default
    end
  end
end
