ActiveAdmin.register User do
  actions :index, :show
  menu parent: "系统设置" 

  controller do 
    #更改默认搜索范围
    #index仅显示 当前社区
    def scoped_collection
      User.subdistrict_is(current_admin_user.subdistrict_id)
    end
  end

  index do
    selectable_column
    id_column
    column :phone
    column :name, sortable: :name
    column :sex, sortable: :sex
    column :birth, sortable: :birth
    column :nickname, sortable: :nickname
    column :current_sign_in_at
    column :sign_in_count
    column :created_at

    actions
  end

  show do |user|
    attributes_table do
      row :phone
      row :name, sortable: :name
      row :sex, sortable: :sex
      row :birth, sortable: :birth
      row :nickname, sortable: :nickname
      row :current_sign_in_at
      row :sign_in_count
      row :created_at
    end
  end
end