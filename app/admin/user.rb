ActiveAdmin.register User do
  index do
    selectable_column
    id_column
    column :phone
    column :name
    column :sex
    column :birth
    column :nickname
    column :current_sign_in_at
    column :sign_in_count
    column :created_at

    actions
  end
end