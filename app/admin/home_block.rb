ActiveAdmin.register HomeBlock do
  menu parent: "系统设置"#, parent_priority: 1
  actions :all
  permit_params :title, :ranking, home_block_cover_attributes: [:id, :desc, :photo, :_destroy]
  config.sort_order = 'ranking_asc'
  
  controller do 
    #更改默认搜索范围
    #index仅显示 当前社区中 正在销售的商品
    def scoped_collection
      current_admin_user.home_blocks
    end

    def create
      super
      @home_block.admin_user_id = current_admin_user.id
      @home_block.save
    end

  end

  index do 
    selectable_column
    column :title
    column :ranking
    column :home_block_cover do |home_block|
      link_to(image_tag(home_block.home_block_cover.photo.url(:mini)), home_block.home_block_cover.photo.url, target: "_blank") if home_block.home_block_cover
    end
    actions 
  end

  form html: {multipart: true} do |f|
    f.inputs do 
      f.input :title, as: :select, collection: ['智慧健康', '健步达人', '智慧家居', '社区活动', '社区IT', '上门服务', '精品超市', '限量发售'] 
      f.input :ranking
      f.fields_for :home_block_cover, for: [:home_block_cover, f.object.home_block_cover || f.object.build_home_block_cover] do |cf|
        image = cf.object
        cf.input :photo, as: :file, label: "模块封面图", hint: (image.try(:photo).blank?) \
          ? cf.template.content_tag(:span, "还未上传图片文件")
          : cf.template.link_to(image_tag(image.photo.url(:medium)), image.photo.url(:s750), target: "_blank")
      end
      f.semantic_errors *f.object.errors.keys
    end

    f.actions
  end

  show do |home_block|
    attributes_table do
      row :title
      row :ranking
      row :home_block_cover do
        if home_block.home_block_cover
          link_to(image_tag(home_block.home_block_cover.photo.url(:medium)), home_block.home_block_cover.photo.url, target: "_blank")
        end
      end
      row " " do 
        link_to "返回列表", admin_home_blocks_path
      end
    end
  end

end