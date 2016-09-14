ActiveAdmin.register Sport::Weekly do
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
    column :cweek
    column :count
    column :updated_at
  end
end