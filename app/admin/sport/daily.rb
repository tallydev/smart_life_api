ActiveAdmin.register Sport do
  menu parent: "健步达人"
  config.sort_order = 'count_desc'
  # filter :subdistrict_id
  controller do 
    #更改默认搜索范围
    #index仅显示 当前社区
    def scoped_collection
      Sport.subdistrict_is(current_admin_user.subdistrict_id)
    end
  end

  index do
    column :rank
    column :user_phone do |obj|
      obj.try(:user).try(:phone)
    end
    column :user_nickname do |obj|
      obj.try(:user).try(:nickname)
    end
    column :date
    column :count
  end

  csv do
    column :rank
    column :user_phone do |obj|
      obj.try(:user).try(:phone)
    end
    column :user_nickname do |obj|
      obj.try(:user).try(:nickname)
    end
    column :date
    column :count
  end
end