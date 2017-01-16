ActiveAdmin.register Activity::Sqhd do
  # menu parent: "预约信息"
  menu priority: 9
  # 
  permit_params :title,
    image_attributes: [:id, :desc, :photo, :_destroy],
    detail_image_attributes: [:id, :desc, :photo, :_destroy]

  index do
    column :id
    column :title
    column :image do |activity|
      link_to(image_tag(activity.image.photo.url(:mini)), activity.image.photo.url) if activity.image
    end
    column :detail_image do |activity|
      link_to(image_tag(activity.detail_image.photo.url(:mini)), activity.detail_image.photo.url) if activity.detail_image
    end
    column :created_at

    actions
  end

  form html: {multipart: true} do |f|
    f.inputs do 
      f.input :title
      f.fields_for :image, for: [:image, f.object.image || f.object.build_image] do |cf|
        image = cf.object
        cf.input :photo, as: :file, label: "活动主图", hint: (image.try(:photo).blank?) \
          ? cf.template.content_tag(:span, "还未选择图片文件")
          : cf.template.link_to(image_tag(image.photo.url(:medium)), image.photo.url, target: "_blank")
      end
      f.fields_for :detail_image, for: [:detail_image, f.object.detail_image || f.object.build_detail_image] do |cf|
        detail_image = cf.object
        cf.input :photo, as: :file, label: "活动详细图", hint: (detail_image.try(:photo).blank?) \
          ? cf.template.content_tag(:span, "还未选择图片文件")
          : cf.template.link_to(image_tag(detail_image.photo.url(:medium)), detail_image.photo.url, target: "_blank")
      end
    end

    f.actions
  end

  show do |activity|
    attributes_table do
      row :title
      row :image do
        if activity.image
          link_to(image_tag(activity.image.photo.url(:medium)), activity.image.photo.url, target: "_blank")
        end
      end
      row :detail_image do
        if activity.detail_image
          link_to(image_tag(activity.detail_image.photo.url(:medium)), activity.detail_image.photo.url, target: "_blank")
        end
      end

    end
  end
end