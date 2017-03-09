ActiveAdmin.register News do
  menu parent: '政府直通车'
  actions :all
  permit_params :title, :content, 
  	news_cover_attributes: [:id, :desc, :photo, :_destroy]
  	# news_detail_attributes: [:id, :desc, :photo, :_destroy]
  
  filter :sort # ?
  # filter :state, emun: true

  # scope_to do 
  #   news.sale_off
  # end
  # scope :for_sale, default: true
  
  controller do 
    #更改默认搜索范围
    #index仅显示 当前社区中 正在销售的商品
    # def scoped_collection
    #   news.subdistrict_is(current_admin_user.subdistrict_id).supermarket.for_sale
    # end

    def create
      super
      @news.subdistrict_id = current_admin_user.subdistrict_id
      @news.save
    end

    def update
      @news = News.find(params[:id])
      @news.news_sort = NewsSort.title_is(sort_params[:sort]).try(:first)
      super
    end


    private
      def sort_params
        params.require(:news).permit(:sort)
      end
  end

  index do 

    selectable_column
    column :id
    column :title
    column :sort
    # column :content
    # column :subdistrict_id
    # column :created_at
    # column :updated_at
    column :news_cover do |news|
      link_to(image_tag(news.news_cover.photo.url(:mini)), news.news_cover.photo.url, target: "_blank") if news.news_cover
    end

    # column :news_detail do |news|
    #   link_to(image_tag(news.news_detail.photo.url(:mini)), news.news_detail.photo.url(:s750), target: "_blank") if news.news_detail
    # end

    actions 
  end

  form html: {multipart: true} do |f|
    f.inputs do 
      f.input :title
      f.input :content, :as => :ckeditor
      # f.input :subdistrict_id
      # f.input :sort, as: :select, collection: NewsSort.subdistrict_is(current_admin_user.subdistrict_id).collect(&:title)
      f.input :sort, as: :select, collection: NewsSort.all.collect(&:title)

      f.fields_for :news_cover, for: [:news_cover, f.object.news_cover || f.object.build_news_cover] do |cf|
        image = cf.object
        cf.input :photo, as: :file, label: "新闻主图", hint: (image.try(:photo).blank?) \
          ? cf.template.content_tag(:span, "还未上传图片文件")
          : cf.template.link_to(image_tag(image.photo.url(:medium)), image.photo.url(:s750), target: "_blank")
      end

      # f.fields_for :news_detail, for: [:news_detail, f.object.news_detail || f.object.build_news_detail] do |cf|
      #   image = cf.object
      #   cf.input :photo, as: :file, label: "新闻详情图", hint: (image.try(:photo).blank?) \
      #     ? cf.template.content_tag(:span, "还未上传图片文件")
      #     : cf.template.link_to(image_tag(image.photo.url(:medium)), image.photo.url(:s750), target: "_blank")
      # end
      f.semantic_errors *f.object.errors.keys
    end

    f.actions
  end

  show do |news|

    attributes_table do
      row :title
      row :sort
      row :content do 
        news.content.html_safe 
      end
      # row :subdistrict_id
      # row :created_at
      # row :updated_at
      row :news_cover do
        if news.news_cover
          link_to(image_tag(news.news_cover.photo.url(:medium)), news.news_cover.photo.url, target: "_blank")
        end
      end
      # row :news_detail do
      #   if news.news_detail
      #     link_to(image_tag(news.news_detail.photo.url(:medium)), news.news_detail.photo.url(:s750), target: "_blank")
      #   end
      # end

      row " " do
        link_to "修改该新闻", edit_admin_news_path(news)
      end

      row " " do
        link_to "返回新闻列表", :back
      end

    end

  end

end