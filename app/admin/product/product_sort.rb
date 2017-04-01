ActiveAdmin.register ProductSort do
  # menu parent: "商品相关"
  menu parent: "购物"
  actions :all 
  permit_params :title, product_sort_icon_attributes: [:id, :desc, :photo, :_destroy]

  controller do 
    #更改默认搜索范围
    #index仅显示 当前社区
    def scoped_collection
      ProductSort.subdistrict_is(current_admin_user.subdistrict_id)
    end

    def create
      super
      @product_sort.subdistrict_id = current_admin_user.subdistrict_id
      @product_sort.save  
    end

    def update
      super
      @product_sort.subdistrict_id = current_admin_user.subdistrict_id
      @product_sort.save
    end

    def destroy
      @product_sort =  ProductSort.find(params[:id])

      ActiveRecord::Base.transaction do
        @product_sort.products.each do |product|
        	product.product_sort_id = nil
        	product.save
      	end
        @product_sort.destroy
    	end
      redirect_to :back
    end
  end

  index do 

    selectable_column
    # id_column
    column :title
    # column :created_at
    # column :updated_at
    column :product_sort_icon do |product|
      link_to(image_tag(product.product_sort_icon.photo.url(:mini)), product.product_sort_icon.photo.url, target: "_blank") if product.product_sort_icon
    end
   
    actions 
  end


  form html: {multipart: true} do |f|
    f.inputs do 
      f.input :title

      f.fields_for :product_sort_icon, for: [:product_sort_icon, f.object.product_sort_icon || f.object.build_product_sort_icon] do |cf|
        image = cf.object
        cf.input :photo, as: :file, label: "商品主图", hint: (image.try(:photo).blank?) \
          ? cf.template.content_tag(:span, "还未上传图片文件")
          : cf.template.link_to(image_tag(image.photo.url(:medium)), image.photo.url(:s750), target: "_blank") 
      end

    end

    f.actions
  end

  show do |product|
    attributes_table do
      row :title
      # row :created_at
      # row :updated_at
      row :product_sort_icon do
        if product.product_sort_icon
          link_to(image_tag(product.product_sort_icon.photo.url(:medium)), product.product_sort_icon.photo.url, target: "_blank")
        end
      end

      row " " do
        link_to "返回商品类别列表", admin_product_sorts_path
      end

    end
  end


end