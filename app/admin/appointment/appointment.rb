ActiveAdmin.register Appointment do
  # menu parent: "预约信息"

  index do
    selectable_column
    id_column
    column :human_type
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