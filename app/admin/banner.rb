ActiveAdmin.register Banner do
  # menu parent: "首页轮播图"
  actions :all 
  permit_params :title, :position, image_attributes: [:id, :desc, :photo, :_destroy]

  # controller do 
    
  #   def destroy
  #     @banner_sort =  bannerSort.find(params[:id])

  #     ActiveRecord::Base.transaction do
  #       @banner_sort.banners.each do |banner|
  #       	banner.banner_sort_id = nil
  #       	banner.save
  #     	end
  #       @banner_sort.destroy
  #   	end
  #     redirect_to :back
  #   end
  # end

  index do 

    selectable_column
    # id_column
    column :title
    column :position
    # column :created_at
    # column :updated_at
    column :image do |banner|
      link_to(image_tag(banner.image.photo.url(:mini)), banner.image.photo.url, target: "_blank") if banner.image
    end
   
    actions 
  end


  form html: {multipart: true} do |f|
    f.inputs do 
      f.input :title
      f.input :position

      f.fields_for :image, for: [:image, f.object.image || f.object.build_image] do |cf|
        image = cf.object
        cf.input :photo, as: :file, label: "轮播图主图", hint: (image.try(:photo).blank?) \
          ? cf.template.content_tag(:span, "还未上传图片文件")
          : cf.template.link_to(image_tag(image.photo.url(:medium)), image.photo.url(:s750), target: "_blank") 
      end

    end

    f.actions
  end

  show do |banner|
    attributes_table do
      row :title
      row :position
      # row :created_at
      # row :updated_at
      row :image do
        if banner.image
          link_to(image_tag(banner.image.photo.url(:medium)), banner.image.photo.url, target: "_blank")
        end
      end

      row " " do
        link_to "返回轮播图列表", admin_banners_path
      end

    end
  end


end