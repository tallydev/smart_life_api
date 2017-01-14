ActiveAdmin.register Promotion do
  # menu parent: "限量销售商品相关"
  actions :all
  permit_params :id, :title, :price, :count, :expiration_time, :detail, :after_discount, product_cover_attributes: [:id, :desc, :photo, :_destroy], product_detail_attributes: [:id, :desc, :photo, :_destroy]
  menu priority: 7
  # filter :state, emun: true
  
  controller do 
    #更改默认搜索范围
    # index仅显示 正在销售
    def scoped_collection
      Promotion.for_sale
    end
    
    def destroy
      ActiveRecord::Base.transaction do
        @promotion = Promotion.find(params[:id])
        @promotion.sale_off!
        @promotion.count = 0 #防止下架限量销售商品加入购物车
        @promotion.cart_items.each do |cart_item|
          cart_item.sale_off!
        end
        @promotion.save
        redirect_to :back
      end
    end

    # def update
    #   @promotion = Promotion.find(params[:id])
    #   @promotion.product_sort = ProductSort.title_is(sort_params[:sort]).try(:first)
    #   super
    # end

    # def create
    #   super
    #   @promotion.product_sort = ProductSort.title_is(sort_params[:sort]).try(:first)
    #   @promotion.save
    # end

    # private
    #   def sort_params
    #     params.require(:product).permit(:sort)
    #   end
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
    column :expiration_time
    column :detail
    # column :sort
    # column :created_at
    # column :updated_at
    column :product_cover do |promotion|
      link_to(image_tag(promotion.product_cover.photo.url(:mini)), promotion.product_cover.photo.url, target: "_blank") if promotion.product_cover
    end

    column :product_detail do |promotion|
      link_to(image_tag(promotion.product_detail.photo.url(:mini)), promotion.product_detail.photo.url(:s750), target: "_blank") if promotion.product_detail
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
      f.input :expiration_time

      f.input :detail
      # f.input :sort, as: :select, collection: ProductSort.all.collect(&:title)
      f.fields_for :product_cover, for: [:product_cover, f.object.product_cover || f.object.build_product_cover] do |cf|
        image = cf.object
        cf.input :photo, as: :file, label: "限量销售商品主图", hint: (image.try(:photo).blank?) \
          ? cf.template.content_tag(:span, "还未上传图片文件")
          : cf.template.link_to(image_tag(image.photo.url(:medium)), image.photo.url(:s750), target: "_blank")
      end

      f.fields_for :product_detail, for: [:product_detail, f.object.product_detail || f.object.build_product_detail] do |cf|
        image = cf.object
        cf.input :photo, as: :file, label: "限量销售商品详情图", hint: (image.try(:photo).blank?) \
          ? cf.template.content_tag(:span, "还未上传图片文件")
          : cf.template.link_to(image_tag(image.photo.url(:medium)), image.photo.url(:s750), target: "_blank")
      end
      f.semantic_errors *f.object.errors.keys
    end

    f.actions
  end

  show do |product|
    attributes_table do
      row :id
      row :title
      row :price
      row :after_discount
      row :discount_rate
      row :count
      row :expiration_time
      row :detail
      # row :sort
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
        link_to "限量销售商品轮播图", admin_product_product_banners_path(product)
      end

      row " " do
        link_to "修改限量销售商品信息", edit_admin_promotion_path(promotion)
      end

      row " " do
        link_to "返回限量销售商品列表", admin_promotions_path
      end
    end
  end

end