ActiveAdmin.register Activity::Sqhd do
  # menu parent: "预约信息"

  permit_params :title,
    image_attributes: [:id, :desc, :photo, :_destroy]

  index do
    column :title
    column :image do |activity|
      link_to(image_tag(activity.image.photo.url(:mini)), activity.image.photo.url) if activity.image
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

    end
  end
end