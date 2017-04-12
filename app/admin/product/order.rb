ActiveAdmin.register Order do
	# menu parent, "商品相关"
  menu parent: "购物" 
  actions :index, :show

  filter :title
  filter :paid_time

  controller do 
    #更改默认搜索范围
    #index仅显示 正在销售
    def scoped_collection
      Order.subdistrict_is(current_admin_user.subdistrict_id).state_is([2,3])
    end
  end

  member_action :shipping, method: :put do
    @order = Order.find(params[:id])
    @order.shipped!
    redirect_to :back
  end

  member_action :cannel_shipping, method: :put do
    @order = Order.find(params[:id])
    @order.paid!
    redirect_to :back
  end

  collection_action :sales_xls, method: :post do 
    begin
      @xls_file = XlsService.new(current_admin_user).order_cart_items(params)
      request.format = "xls"
      respond_to do |format|
          format.xls {
              send_data( @xls_file,
                  :type => "text/excel;charset=utf-8; header=present",
                  :filename => "hahaha.xls" )
          }
      end
    rescue => error
      redirect_to :back
    end
  end

  action_item :xls, only: :index do 
    link_to '下载销售统计表', "/admin/orders/sales_xls?" + params.to_param, method: :post
  end

  index do 
# p self.class
#    p self.instance_variable_get(:@arbre_context) 
#      p '======='
#      p self.instance_variable_get(:@children)
#       p '======='
#       p self.instance_variable_get(:@attributes)
#       p '======='
#       p self.instance_variable_get(:@parent)
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
    column :order_type
    # column :created_at
    # column :updated_at
p 'do index table now'
    column "发货" do |order|
      if order.state == "paid"
        link_to "确认发货", "/admin/orders/#{order.id}/shipping", method: :put
      else
        link_to "已发货", "/admin/orders/#{order.id}/cannel_shipping", method: :put
      end
    end
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
      row :order_type
      # row :created_at
      # row :updated_at
      _contact = order.contact

      row "收货地址" do
        _contact ? _contact.output : ""
      end

      row "联系电话" do 
        _contact ? _contact.phone : ""
      end

      row "联系人" do 
        _contact ? _contact.name : ""
      end
      # order.cart_item_info.split("@;@")
      _cart_items =  order.cart_item_info.split("@;@").map do |cart_item|
        _info = cart_item.split("@*@")
        { 
          "名称" => _info[1],
          "折后价" => _info[2].to_f,
          "数量" => _info[4].to_i,
          "该项总价" => (_info[2].to_f * _info[4].to_i).round(1)
        }
      end

      table_for _cart_items do 
        column "名称"
        column "数量"
        column "折后价"
        column "该项总价" 
      end

      row " " do
        link_to "返回列表", admin_orders_path
      end
    end
  end


end


