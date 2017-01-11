require "acceptance_helper"

resource "订单与支付相关接口" do
  header "Accept", "application/json"

  user_attrs = FactoryGirl.attributes_for(:user)

	header "X-User-Token", user_attrs[:authentication_token]
	header "X-User-Phone", user_attrs[:phone]

	before do 
    @AdminUser = create(:admin_user, postage: 10.0)
		@products = create_list(:product, 3)
    @user = create(:user)
    @contact = create(:contact)
    
    @orders = create_list(:order, 2, user: @user, contact_id: @contact.id)
    @cart_item1 = create(:cart_item, user: @user, product: @products.first,
                          order: @orders.first)
    @cart_item2 = create(:cart_item, user: @user, product: @products.second)
    @cart_item3 = create(:cart_item, user: @user, product: @products.last)
    @cart_item4 = create(:cart_item, user: @user, product: @products.last,
                                      count: 100)
  end


  get 'orders' do 

    parameter :page, "当前页", require: false
    parameter :per_page, "每页的数量", require: false
    parameter :state, "状态, state:{ unpaid: 未支付, paid: 已支付, canceled: 已取消}, require: :false"

    let(:page) {1}
    let(:per_page) {5}
    let(:state) {"unpaid"}
    example "查看订单列表成功, 默认为全部, 可单参数查询" do
      @orders.first.paid!
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end

  get 'orders/:id' do 
    let(:id) {@orders.first.id}
    example "查看某订单详情成功" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end

	post 'orders' do
		parameter :cart_item_ids, "购物车项目的id数组", required: true
    parameter :contact_id, "联系人id", required: true, scope: :order

		let(:cart_item_ids) {[@cart_item2.id, @cart_item3.id]}
    let(:contact_id) { @contact.id }

		example "创建订单成功" do
      do_request
      puts response_body
      expect(status).to eq 201
    end

    describe "创建订单失败" do 

      let(:cart_item_ids) {[@cart_item2.id, @cart_item4.id]}

      example "创建订单失败" do
        do_request
        puts response_body
        expect(status).to eq 422
      end
    end
  end

  post 'orders/create_by_promotion' do
    parameter :promotion_id, "所选 限量销售商品的 id", required: true
    parameter :promotion_count, "所选 限量销售商品的 数量", required: true
    parameter :contact_id, "联系人id", required: true, scope: :order

    before do 
      p @promotion = create(:promotion, product_type: 1, count: 5)
      # p "+====================================="
      # p Product.all 
      # p "+====================================="
      # p Promotion.all
    end

    let(:promotion_id) { @promotion.id }
    let(:promotion_count) { 2 }
    let(:contact_id) { @contact.id }

    example "限量销售  创建订单成功" do
      do_request
      puts response_body
      expect(status).to eq 201
    end

    # describe "限量销售 创建订单失败" do 

    #   let(:cart_item_ids) {[@cart_item2.id, @cart_item4.id]}

    #   example "创建订单失败" do
    #     do_request
    #     puts response_body
    #     expect(status).to eq 422
    #   end
    # end
  end

  post 'orders/:id/create_payment' do

    parameter :pay_way, "支付渠道 alipay wx", require: true

    let(:id) { @orders.first.id }
    let(:pay_way) { "alipay" }

    example "扣除库存后，发起支付" do
      do_request
      puts response_body
      expect(status).to eq 201
    end

  end 

  post 'orders/:id/recover_stocks' do
    let(:id) { @orders.first.id }

    example "恢复库存" do
      do_request
      puts response_body
      expect(status).to eq 201
    end

  end 

  delete 'orders/:id' do

    let(:id) { @orders.first.id }

    example "删除（取消）订单" do
      do_request
      puts response_body
      expect(status).to eq(204)
    end
  end




end