ActiveAdmin.register Subdistrict do
	# menu parent, "社区相关"
  actions :index, :show, :edit, :update, :new
  permit_params :province, :city, :district, :subdistrict
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
    end
    label "注： 不支持删除。"
    f.actions
  end
end


