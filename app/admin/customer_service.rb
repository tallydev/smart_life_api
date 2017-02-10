ActiveAdmin.register CustomerService do
  menu parent: "系统设置" 
  permit_params :name, :phone

  controller do 
    #更改默认搜索范围
    #index仅显示 当前社区中 正在销售的商品
    def scoped_collection
      CustomerService.subdistrict_is(current_admin_user.subdistrict_id)
    end

    def update
       super
      @customer_service.subdistrict_id = current_admin_user.subdistrict_id
      @customer_service.save
    end

    def create
      super
      @customer_service.subdistrict_id = current_admin_user.subdistrict_id
      @customer_service.save
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :phone
    actions
  end

  form do |f|
    f.inputs  do
      f.input :name
      f.input :phone
    end
    f.actions
  end

  show do |admin_user|
    attributes_table do
      row :name
      row :phone
    end
  end

end
