ActiveAdmin.register Sport::Weekly do
  menu parent: "健步达人"
  config.sort_order = 'count_desc'

  controller do 
    #更改默认搜索范围
    #index仅显示 正在销售
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
    column :year
    column :cweek
    column :count
    column :updated_at
  end

  csv do
    column :rank
    column :user_phone do |obj|
      obj.try(:user).try(:phone)
    end
    column :user_nickname do |obj|
      obj.try(:user).try(:nickname)
    end
    column :year
    column :cweek
    column :count
    column :updated_at
  end  
end