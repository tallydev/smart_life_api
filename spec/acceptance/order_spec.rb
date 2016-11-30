require "acceptance_helper"

resource "订单与支付相关接口" do
  header "Accept", "application/json"

  user_attrs = FactoryGirl.attributes_for(:user)

	header "X-User-Token", user_attrs[:authentication_token]
	header "X-User-Phone", user_attrs[:phone]

	before do 
		@products = create_list(:product, 3)
    @user = create(:user)
    
    @orders = create_list(:order, 2, user: @user)
    @cart_item1 = create(:cart_item, user: @user, product: @products.first,
                          order: @orders.first)
    @cart_item2 = create(:cart_item, user: @user, product: @products.second)
    @cart_item3 = create(:cart_item, user: @user, product: @products.last)
    @cart_item4 = create(:cart_item, user: @user, product: @products.last,
                                      count: 100)
  end


  get 'orders' do 
    example "查看订单列表成功" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end

	post 'orders' do
		parameter :cart_item_ids, "购物车项目的id数组", required: true
		parameter :user_id, "用户的id", required: true, scope: :order


		let(:cart_item_ids) {[@cart_item2.id, @cart_item3.id]}
		let(:user_id) {@user.id}

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

  post 'orders/:id/create_payment' do
    let(:id) { @orders.first.id }

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




end