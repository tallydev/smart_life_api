ActiveAdmin.register Order do
	# menu parent: "商品相关"
  actions :index, :show

  filter :title
  # filter :state, emun: true

  
  controller do 
    #更改默认搜索范围
    #index仅显示 正在销售
    def scoped_collection
      Order.is_paid
    end
  end

  index do 
  	# selectable_column
    # id_column
    # column :state
    column :seq
    column :phone
    column :pay_way_alias
    column :price
    # column :without_postage
    column :postage
    column :paid_time_output
    # column :created_at
    # column :updated_at
    actions
  end

  show do |order|
    attributes_table do
      row :seq
      row :phone do 
        link_to "#{order.user.phone}", admin_user_path(order.user)
      end
      # row :contact
      row :pay_way_alias
      row :price
      # row :without_postage
      row :postage
      row :paid_time_output
      # row :created_at
      # row :updated_at

      row " " do
        link_to "返回列表", admin_orders_path
      end
    end
  end


end


