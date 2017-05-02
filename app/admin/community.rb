ActiveAdmin.register Community do
	belongs_to :subdistrict, optional: true
	menu false
	actions :all
	permit_params :name

	index do 
  	# selectable_column
    id_column

    column :name
    column " " do 
      link_to "返回街道列表", admin_subdistricts_path
    end 
    actions
  end

  show do |community|
    attributes_table do
      row :name
      # row :created_at
      # row :updated_at

      row " " do
        link_to "返回街道列表", admin_subdistrict_communities_path(community.subdistrict)
      end
    end
  end

  form html: {multipart: true} do |f|
    f.inputs do 
      f.input :name
    end

    f.actions
  end

end


