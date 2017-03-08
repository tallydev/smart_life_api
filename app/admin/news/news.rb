# ActiveAdmin.register News do
#   menu parent: "购物", parent_priority: 1
#   actions :all
#   permit_params :title, :price, :count, :detail, :subdistrict_id, :after_discount, news_cover_attributes: [:id, :desc, :photo, :_destroy], news_detail_attributes: [:id, :desc, :photo, :_destroy]
  
#   filter :title
#   # filter :state, emun: true

#   # scope_to do 
#   #   news.sale_off
#   # end
#   # scope :for_sale, default: true
  
#   controller do 
#     #更改默认搜索范围
#     #index仅显示 当前社区中 正在销售的商品
#     def scoped_collection
#       news.subdistrict_is(current_admin_user.subdistrict_id).supermarket.for_sale
#     end
    
#     def destroy
#       ActiveRecord::Base.transaction do
#         @news = news.subdistrict_is(current_admin_user.subdistrict_id).find(params[:id])
#         @news.sale_off!
#         @news.count = 0 #防止下架商品加入购物车
#         @news.cart_items.each do |cart_item|
#           cart_item.sale_off!
#         end
#         @news.save
#         redirect_to :back
#       end
#     end

#     def update
#       @news = news.find(params[:id])
#       @news.news_sort = newsSort.title_is(sort_params[:sort]).try(:first)
#       super
#     end

#     def create
#       super
#       @news.news_sort = newsSort.title_is(sort_params[:sort]).try(:first)
#       @news.subdistrict_id = current_admin_user.subdistrict_id
#       @news.save
#     end

#     private
#       def sort_params
#         params.require(:news).permit(:sort)
#       end
#   end

#   index do 

#     selectable_column
#     # id_column
#     # column :state
#     column :id
#     column :title
#     column :price
#     column :after_discount
#     column :discount_rate
#     column :count
#     column :detail
#     column :sort
#     # column :subdistrict_id
#     # column :created_at
#     # column :updated_at
#     column :news_cover do |news|
#       link_to(image_tag(news.news_cover.photo.url(:mini)), news.news_cover.photo.url, target: "_blank") if news.news_cover
#     end

#     column :news_detail do |news|
#       link_to(image_tag(news.news_detail.photo.url(:mini)), news.news_detail.photo.url(:s750), target: "_blank") if news.news_detail
#     end

#     column :news_banners do |news|
#       link_to "查看轮播图", admin_news_news_banners_path(news)
#     end
   
#     actions 
#     # column :state do |news|
#     #   "已下架" if news.state == 'sale_off'
#     # end
#   end

#   form html: {multipart: true} do |f|
#     f.inputs do 
#       f.input :title
#       f.input :price,  min: 0
#       f.input :after_discount,  min: 0
#       f.input :count
#       f.input :detail
#       # f.input :subdistrict_id
#       f.input :sort, as: :select, collection: newsSort.subdistrict_is(current_admin_user.subdistrict_id).collect(&:title)
#       f.fields_for :news_cover, for: [:news_cover, f.object.news_cover || f.object.build_news_cover] do |cf|
#         image = cf.object
#         cf.input :photo, as: :file, label: "商品主图", hint: (image.try(:photo).blank?) \
#           ? cf.template.content_tag(:span, "还未上传图片文件")
#           : cf.template.link_to(image_tag(image.photo.url(:medium)), image.photo.url(:s750), target: "_blank")
#       end

#       f.fields_for :news_detail, for: [:news_detail, f.object.news_detail || f.object.build_news_detail] do |cf|
#         image = cf.object
#         cf.input :photo, as: :file, label: "商品详情图", hint: (image.try(:photo).blank?) \
#           ? cf.template.content_tag(:span, "还未上传图片文件")
#           : cf.template.link_to(image_tag(image.photo.url(:medium)), image.photo.url(:s750), target: "_blank")
#       end
#       f.semantic_errors *f.object.errors.keys
#     end

#     f.actions
#   end

#   show do |news|
#     attributes_table do
#       row :title
#       row :price
#       row :after_discount
#       row :discount_rate
#       row :count
#       row :detail
#       row :sort
#       # row :subdistrict_id
#       # row :created_at
#       # row :updated_at
#       row :news_cover do
#         if news.news_cover
#           link_to(image_tag(news.news_cover.photo.url(:medium)), news.news_cover.photo.url, target: "_blank")
#         end
#       end

#       row :news_detail do
#         if news.news_detail
#           link_to(image_tag(news.news_detail.photo.url(:medium)), news.news_detail.photo.url(:s750), target: "_blank")
#         end
#       end

#       row :news_banners do
#         link_to "商品轮播图", admin_news_news_banners_path(news)
#       end

#       row " " do
#         link_to "修改商品信息", edit_admin_news_path(news)
#       end

#       row " " do
#         link_to "返回商品列表", admin_newss_path
#       end
#     end
#   end

# end