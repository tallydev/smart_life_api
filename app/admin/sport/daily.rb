if Rails.env != 'development' && Subdistrict.table_exists?
  Subdistrict.all.each do  |s|
    ActiveAdmin.register Sport.get_const(s.id) do 

      menu parent: "健步达人", priority: 1, label: "每日统计", if: proc{ current_admin_user.subdistrict_id == s.id}
      config.sort_order = 'count_desc'

      index do
        label "查看其它社区信息，请登录对应社区管理员账号"
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
  end
end

# ActiveAdmin.register Sport do
#   menu parent: "健步达人"
  # config.sort_order = 'count_desc'
  # filter :subdistrict_id

  # controller do 
  #   #更改默认搜索范围
  #   #index仅显示 正在销售
  #   def scoped_collection
  #     Sport.get_const(current_admin_user.subdistrict_id).order("count DESC")
  #   end
  # end

  # # scope default: true do 

  # # end

  # index do
  # aaa= current_admin_user.subdistrict_id
  #   column :rank
  #   column :user_phone do |obj|
  #     obj.try(:user).try(:phone)
  #   end
  #   column :user_nickname do |obj|
  #     obj.try(:user).try(:nickname)
  #   end
  #   column :date
  #   column :count

  # end

  # csv do
  #   column :rank
  #   column :user_phone do |obj|
  #     obj.try(:user).try(:phone)
  #   end
  #   column :user_nickname do |obj|
  #     obj.try(:user).try(:nickname)
  #   end
  #   column :date
  #   column :count
  # end
# end