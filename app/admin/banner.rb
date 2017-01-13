ActiveAdmin.register Banner do
  # menu parent: "首页轮播图"
  actions :all 
  permit_params :title, :position, :banner_type, :type_id, banner_cover_attributes: [:id, :desc, :photo, :_destroy], banner_detail_attributes: [:id, :desc, :photo, :_destroy]

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
    column :banner_type
    column :type_id
    # column :created_at
    # column :updated_at
    column :banner_cover do |banner|
      link_to(image_tag(banner.banner_cover.photo.url(:mini)), banner.banner_cover.photo.url, target: "_blank") if banner.banner_cover
    end

    column :banner_detail do |banner|
      link_to(image_tag(banner.banner_detail.photo.url(:mini)), banner.banner_detail.photo.url, target: "_blank") if banner.banner_detail
    end

    actions 
  end


  form html: {multipart: true} do |f|
    f.inputs do 
      f.input :title
      f.input :position
      f.input :banner_type, as: :select, collection: ["图片详情", "精品超市", "限量销售", "社区活动"], include_blank: false
      f.input :type_id

      f.fields_for :banner_cover, for: [:banner_cover, f.object.banner_cover || f.object.build_banner_cover] do |cf|
        image = cf.object
        cf.input :photo, as: :file, label: "轮播图主图", hint: (image.try(:photo).blank?) \
          ? cf.template.content_tag(:span, "还未上传图片文件")
          : cf.template.link_to(image_tag(image.photo.url(:medium)), image.photo.url(:s750), target: "_blank") 
      end

      f.fields_for :banner_detail, for: [:banner_detail, f.object.banner_detail || f.object.build_banner_detail] do |cf|
        image = cf.object
        cf.input :photo, as: :file, label: "轮播图详情图", hint: (image.try(:photo).blank?) \
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
      row :banner_type
      row :type_id
      # row :created_at
      # row :updated_at
      row :banner_cover do
        if banner.banner_cover
          link_to(image_tag(banner.banner_cover.photo.url(:medium)), banner.banner_cover.photo.url, target: "_blank")
        end
      end

      row :banner_detail do
        if banner.banner_detail
          link_to(image_tag(banner.banner_detail.photo.url(:medium)), banner.banner_detail.photo.url, target: "_blank")
        end
      end

      row " " do
        link_to "返回轮播图列表", admin_banners_path
      end

    end
  end


end