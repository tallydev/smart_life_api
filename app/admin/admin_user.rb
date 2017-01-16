ActiveAdmin.register AdminUser do
  permit_params :postage #:email, :password, :password_confirmation
  menu parent: "系统设置" 
  index do
    selectable_column
    id_column
    column :email
    # column :current_sign_in_at
    # column :sign_in_count
    # column :created_at
    column :postage
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      # f.input :email
      # f.input :password
      # f.input :password_confirmation
      f.input :postage
    end
    f.actions
  end

  show do |admin_user|
    attributes_table do
      row :email
      row :postage
      # row :created_at
      # row :updated_at

    end
  end

end
