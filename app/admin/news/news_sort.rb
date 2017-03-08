ActiveAdmin.register NewsSort do
  menu parent: "政府直通车"
  actions :all 
  permit_params :title, :rank, news_sort_cover_attributes: [:id, :desc, :photo, :_destroy]

  controller do 
    #更改默认搜索范围
    #index仅显示 当前社区
    # def scoped_collection
    #   NewsSort.subdistrict_is(current_admin_user.subdistrict_id)
    # end

    def create
      super
      @news_sort.subdistrict_id = current_admin_user.subdistrict_id
      @news_sort.save  
    end

  end

  index do 

    selectable_column
    # id_column
    column :title
    column :rank
    # column :created_at
    # column :updated_at
    column :news_sort_cover do |news_sort|
      link_to(image_tag(news_sort.news_sort_cover.photo.url(:mini)), news_sort.news_sort_cover.photo.url, target: "_blank") if news_sort.news_sort_cover
    end
   
    actions 
  end


  form html: {multipart: true} do |f|
    f.inputs do 
      f.input :title
      f.input :rank

      f.fields_for :news_sort_cover, for: [:news_sort_cover, f.object.news_sort_cover || f.object.build_news_sort_cover] do |cf|
        image = cf.object
        cf.input :photo, as: :file, label: "新闻类别主图", hint: (image.try(:photo).blank?) \
          ? cf.template.content_tag(:span, "还未上传图片文件")
          : cf.template.link_to(image_tag(image.photo.url(:medium)), image.photo.url(:s750), target: "_blank") 
      end

    end

    f.actions
  end

  show do |news_sort|
    attributes_table do
      row :title
      # row :created_at
      # row :updated_at
      row :news_sort_cover do
        if news_sort.news_sort_cover
          link_to(image_tag(news_sort.news_sort_cover.photo.url(:medium)), news_sort.news_sort_cover.photo.url, target: "_blank")
        end
      end

      row " " do
        link_to "返回新闻类别列表", admin_news_sorts_path
      end

    end
  end


end