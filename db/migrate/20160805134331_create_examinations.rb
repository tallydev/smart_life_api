class CreateExaminations < ActiveRecord::Migration
  def change
    create_table :examinations do |t|
      t.references :user_info, index: true
      t.date :date
      t.float :sbp
      t.float :dbp
      t.float :pulse
      t.float :bo
      t.float :fetalheart
      t.float :glu
      t.float :chol
      t.float :ua
      t.float :fat
      t.float :bmr
      t.float :water
      t.float :height
      t.float :weight
      t.float :bmi
      t.float :waistline
      t.float :hipline
      t.float :whr
      t.float :bmd_t
      t.float :bmd_z

      t.timestamps null: false
    end
    add_index :examinations, :date
  end
end
