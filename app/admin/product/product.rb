ActiveAdmin.register Product do
  # menu parent: "商品相关"
  menu parent: "购物", parent_priority: 1
  actions :all
  permit_params :title, :price, :count, :detail, :subdistrict_id, :after_discount, product_cover_attributes: [:id, :desc, :photo, :_destroy], product_detail_attributes: [:id, :desc, :photo, :_destroy]
  
  filter :title
  # filter :state, emun: true

  # scope_to do 
  #   Product.sale_off
  # end
  # scope :for_sale, default: true
  
  controller do 
    #更改默认搜索范围
    #index仅显示 当前社区中 正在销售的商品
    def scoped_collection
      Product.subdistrict_is(current_admin_user.subdistrict_id).supermarket.for_sale
    end
    
    def destroy
      ActiveRecord::Base.transaction do
        @product = Product.subdistrict_is(current_admin_user.subdistrict_id).find(params[:id])
        @product.sale_off!
        @product.count = 0 #防止下架商品加入购物车
        @product.cart_items.each do |cart_item|
          cart_item.sale_off!
        end
        @product.save
        redirect_to :back
      end
    end

    def update
      @product = Product.find(params[:id])
      @product.product_sort = ProductSort.title_is(sort_params[:sort]).subdistrict_is(current_admin_user.subdistrict_id).try(:first)
      super
    end

    def create
      super
      @product.product_sort = ProductSort.title_is(sort_params[:sort]).subdistrict_is(current_admin_user.subdistrict_id).try(:first)
      @product.subdistrict_id = current_admin_user.subdistrict_id
      @product.save
    end

    private
      def sort_params
        params.require(:product).permit(:sort)
      end
  end

  index do 

    selectable_column
    # id_column
    # column :state
    column :id
    column :title
    column :price
    column :after_discount
    column :discount_rate
    column :count
    column :detail
    column :sort
    # column :subdistrict_id
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
      f.input :after_discount,  min: 0
      f.input :count
      f.input :detail
      # f.input :subdistrict_id
      f.input :sort, as: :select, collection: ProductSort.subdistrict_is(current_admin_user.subdistrict_id).collect(&:title)
      f.fields_for :product_cover, for: [:product_cover, f.object.product_cover || f.object.build_product_cover] do |cf|
        image = cf.object
        cf.input :photo, as: :file, label: "商品主图", hint: (image.try(:photo).blank?) \
          ? cf.template.content_tag(:span, "还未上传图片文件")
          : cf.template.link_to(image_tag(image.photo.url(:medium)), image.photo.url(:s750), target: "_blank")
      end

      f.fields_for :product_detail, for: [:product_detail, f.object.product_detail || f.object.build_product_detail] do |cf|
        image = cf.object
        cf.input :photo, as: :file, label: "商品详情图", hint: (image.try(:photo).blank?) \
          ? cf.template.content_tag(:span, "还未上传图片文件")
          : cf.template.link_to(image_tag(image.photo.url(:medium)), image.photo.url(:s750), target: "_blank")
      end
      f.semantic_errors *f.object.errors.keys
    end

    f.actions
  end

  show do |product|
    attributes_table do
      row :title
      row :price
      row :after_discount
      row :discount_rate
      row :count
      row :detail
      row :sort
      # row :subdistrict_id
      # row :created_at
      # row :updated_at
      row :product_cover do
        if product.product_cover
          link_to(image_tag(product.product_cover.photo.url(:medium)), product.product_cover.photo.url, target: "_blank")
        end
      end

      row :product_detail do
        if product.product_detail
          link_to(image_tag(product.product_detail.photo.url(:medium)), product.product_detail.photo.url(:s750), target: "_blank")
        end
      end

      row :product_banners do
        link_to "商品轮播图", admin_product_product_banners_path(product)
      end

      row " " do
        link_to "修改商品信息", edit_admin_product_path(product)
      end

      row " " do
        link_to "返回商品列表", admin_products_path
      end
    end
  end

end