ActiveAdmin.register Product do
  # menu parent: "商品信息"
  actions :all
  permit_params :title, :price, :count, :detail, product_cover_attributes: [:id, :desc, :photo, :_destroy], product_detail_attributes: [:id, :desc, :photo, :_destroy]

  filter :title
  # filter :state, emun: true
  controller do 
    # def index
    #   # @products  =  Product.state_is("sale_off") 
    #   super
    # end


    def destroy
      @product =  Product.find(params[:id])
      @product.sale_off!
      @product.count = 0 #防止下架商品加入购物车
      @product.save
      redirect_to :back
    end
  end

  index do 

    selectable_column
    # id_column
    # column :state
    column :title
    column :price
    column :count
    column :detail
    # column :created_at
    # column :updated_at
    column :product_cover do |product|
      link_to(image_tag(product.product_cover.photo.url(:mini)), product.product_cover.photo.url, target: "_blank") if product.product_cover
    end

    column :product_detail do |product|
      link_to(image_tag(product.product_detail.photo.url(:mini)), product.product_detail.photo.url(:s750), target: "_blank") if product.product_detail
    end

    column :product_banners do |product|
      link_to "查看轮播图", admin_product_product_banners_path(product)
    end
   
    actions 
    # column :state do |product|
    #   "已下架" if product.state == 'sale_off'
    # end
  end

  form html: {multipart: true} do |f|
    f.inputs do 
      f.input :title
      f.input :price,  min: 0
      f.input :count
      f.input :detail
      
      f.fields_for :product_cover, for: [:product_cover, f.object.product_cover || f.object.build_product_cover] do |cf|
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
      row :price
      row :count
      row :detail
      # row :created_at
      # row :updated_at
      row :product_cover do
        if product.product_cover
          link_to(image_tag(product.product_cover.photo.url(:medium)), product.product_cover.photo.url, target: "_blank")
        end
      end

      row :product_detail do
        if product.product_detail
          link_to(image_tag(product.product_detail.photo.url(:s750)), product.product_detail.photo.url(:s750), target: "_blank")
        end
      end

      row :product_banners do
        link_to "商品轮播图", admin_product_product_banners_path(product)
      end

      row " " do
        link_to "返回商品列表", admin_products_path
      end

    end
  end

end