ActiveAdmin.register Subdistrict do
	# menu parent, "社区相关"
  actions :index, :show, :edit, :update
  permit_params :province, :city, :district, :subdistrict
  index do 
  	# selectable_column
    id_column

    column :province
    column :city
    column :district
    column :subdistrict

    actions
  end

  show do |order|
    attributes_table do
      row :province
	    row :city
	    row :district
	    row :subdistrict
      # row :created_at
      # row :updated_at

      row " " do
        link_to "返回列表", admin_subdistricts_path
      end
    end
  end

  form html: {multipart: true} do |f|
    f.inputs do 
      f.input :province
	    f.input :city
	    f.input :district
	    f.input :subdistrict
    end

    f.actions
  end
end


