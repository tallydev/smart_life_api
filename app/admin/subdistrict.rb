ActiveAdmin.register Subdistrict do
	# menu parent, "社区相关"
  menu parent: "系统设置"  
  actions :index, :show, :edit, :update, :new
  permit_params :province, :city, :district, :subdistrict, :property_phone
  index do 
  	# selectable_column
    id_column

    column :province
    column :city
    column :district
    column :subdistrict
    column :communities do |subdistrict|
      subdistrict.communities.collect(&:name).join(", ")
    end
    column :property_phone

    column " " do  |subdistrict|
      link_to "编辑小区", admin_subdistrict_communities_path(subdistrict)
    end

    actions
  end

  show do |subdistrict|
    attributes_table do
      row :province
	    row :city
	    row :district
	    row :subdistrict
      row :property_phone
      # row :created_at
      # row :updated_at
      row "小区列表" do 
        subdistrict.communities.collect(&:name).join(", ")
      end

      row " " do 
        link_to "编辑小区", admin_subdistrict_communities_path(subdistrict)
      end

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
      f.input :property_phone
    end
    label "注： 不支持删除。"
    f.actions
  end
end


