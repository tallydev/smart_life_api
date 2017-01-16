ActiveAdmin.register AdminUser do
  permit_params :postage, :subdistrict_id, :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    # column :current_sign_in_at
    # column :sign_in_count
    # column :created_at
    column :postage
    column :subdistrict_id
    # column "所属社区" do |admin|
    #   admin.subdistrict.name
    # end
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :postage
      f.input :subdistrict_id

    end
    f.actions
  end

  show do |admin_user|
    attributes_table do
      row :email
      row :postage
      row "所属社区" do 
        admin_user.subdistrict.name
      end
      # row :created_at
      # row :updated_at

    end
  end

end
