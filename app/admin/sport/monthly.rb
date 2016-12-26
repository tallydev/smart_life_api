ActiveAdmin.register Sport::Monthly do
  menu priority: 1
  menu parent: "健步达人"
  config.sort_order = 'count_desc'

  index do
    column :rank
    column :user_phone do |obj|
      obj.try(:user).try(:phone)
    end
    column :user_nickname do |obj|
      obj.try(:user).try(:nickname)
    end
    column :year
    column :month
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
    column :month
    column :count
    column :updated_at
  end
end