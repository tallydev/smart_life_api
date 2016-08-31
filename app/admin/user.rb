ActiveAdmin.register User do
  index do
    selectable_column
    id_column
    column :phone
    column :nickname
    column :sex
    column :birth
    column :current_sign_in_at
    column :sign_in_count
    column :created_at

    actions
  end
end