ActiveAdmin.register ProductBanner do

	belongs_to :product, optional: true
	menu false
	actions :all
	permit_params thumb_attributes: [:id, :desc, :photo, :_destroy]

	index do 
    selectable_column
		# column :id
		i = 1
		column "" do |product_banner|
			if i == 1 
        i -= 1
        link_to "返回商品详情", admin_product_path(product_banner.product)
      end
		end

		link_to "商品详情图", admin_product_product_banners_path(product)
    column :thumb do |product_banner|
      link_to(image_tag(product_banner.thumb.photo.url(:medium)), product_banner.thumb.photo.url) if product_banner.thumb
    end
		actions
	end

	form html: {multipart: true} do |f|
    f.inputs do 
      # f.input :title
      f.fields_for :thumb, for: [:thumb, f.object.thumb || f.object.build_thumb] do |cf|
        thumb = cf.object
        cf.input :photo, as: :file, label: "商品详情图", hint: (thumb.try(:photo).blank?) \
          ? cf.template.content_tag(:span, "还未上传图片文件")
          : cf.template.link_to(image_tag(thumb.photo.url(:medium)), thumb.photo.url, target: "_blank")
      end
     
    end
    f.actions
  end

  show do |product_banner|
    attributes_table do
      row :thumb do
        if product_banner.thumb
          link_to(image_tag(product_banner.thumb.photo.url(:medium)), product_banner.thumb.photo.url, target: "_blank")
        end
      end
     	
      row " " do
      	link_to "返回详情图列表", admin_product_product_banners_path(product)
    	end
    end
  end

end