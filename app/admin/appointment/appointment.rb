ActiveAdmin.register Appointment do
  # menu parent: "预约信息"

  controller do 
    #更改默认搜索范围
    #index仅显示 当前社区
    def scoped_collection
      Appointment.subdistrict_is(current_admin_user.subdistrict_id)
    end
  end

  index do
    selectable_column
    id_column
    column :human_type, sortable: :human_type
    column :phone do |obj|
      obj.user.try(:phone)
    end
    column :idname
    column :count
    column :state
    column :created_at
    column :updated_at

    actions
  end
end