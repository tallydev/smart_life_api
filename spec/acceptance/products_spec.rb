require "acceptance_helper"

resource "购物相关接口" do
  header "Accept", "application/json"

  describe '商品的相关接口' do
    # user_attrs = FactoryGirl.attributes_for(:user)

    # header "X-User-Token", user_attrs[:authentication_token]
    # header "X-User-Phone", user_attrs[:phone]

    before do
      @subdistrict = create(:subdistrict)
      @user = create(:user, subdistrict: @subdistrict)
      header "X-User-Token", @user.authentication_token
      header "X-User-Phone", @user.phone
      @products = create_list(:product, 3, subdistrict: @subdistrict)

      @product_sort = create(:product_sort, 
        title: "我是分类", subdistrict: @subdistrict
        )
      @products.second.product_sort_id = @product_sort.id 
      @products.second.save
    end

    get 'products' do
      parameter :page, "页码", required: false
      parameter :per_page, "每页个数", required: false
      
      let(:page) { 1 }
      let(:per_page) { 10 }

      example "查看商品列表" do
        do_request
        puts response_body
        expect(status).to eq 200
      end
    end

    get 'products/sort' do
      parameter :page, "页码", required: false
      parameter :per_page, "每页个数", required: false
      parameter :product_sort_id, "商品类别id", required: true

      let(:page) { 1 }
      let(:per_page) { 10 }

      let(:product_sort_id) { @product_sort.id }

      example "按类别 查询 商品列表" do
        do_request
        p "====+++====+++=="
        p @user
        puts response_body
        expect(status).to eq 200
      end
    end

    get 'products/:id' do

      let(:id) { @products.first.id }

      example "查看指定商品详情" do
        do_request
        puts response_body
        expect(status).to eq 200
      end
      
    end  
  end

  describe '购物车的相关接口' do
    # user_attrs = FactoryGirl.attributes_for(:user)

    # header "X-User-Token", user_attrs[:authentication_token]
    # header "X-User-Phone", user_attrs[:phone]

    before do
      @subdistrict = create(:subdistrict)
      @products = create_list(:product, 3, subdistrict: @subdistrict)
      @user = create(:user, subdistrict: @subdistrict)
      create(:cart_item, user: @user, product: @products.first, count: 1)
      header "X-User-Token", @user.authentication_token
      header "X-User-Phone", @user.phone

      @cart_items = create_list(:cart_item, 3, user: @user, product: @products.first)
      p @cart_items.second.paid!
      p @cart_items
    end

    post 'cart_items' do
      parameter :product_id, "产品的id", require: true, scope: :cart_item
      parameter :count, "产品的数量", require: true, scope: :cart_item

      let(:product_id) { @products.first.id }
      let(:count) { 2 }

      example "增加购物车一个项目" do
        do_request
        puts response_body
        expect(status).to eq 201 
      end
    end

    get 'cart_items' do
      parameter :page, "页码", required: false
      parameter :per_page, "每页个数", required: false
      
      let(:page) { 1 }
      let(:per_page) { 10 }

      example "查看用户的购物车列表(购物中、已下架与库存不足）" do
        do_request
        puts response_body
        expect(status).to eq 200
      end
    end

    get 'cart_items/:id' do

      let(:id) { @cart_items.first.id }

      example "查看购物车单项详情" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    put 'cart_items/:id' do

      parameter :count, "产品的数量", require: true, scope: :cart_item

      let(:id) { @cart_items.first.id }
      let(:count) { 2 }

      example "修改购物车的数量成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    put 'cart_items/:id' do

      parameter :count, "产品的数量", require: true, scope: :cart_item

      let(:id) { @cart_items.first.id }
      let(:count) { -1 }

      example "修改购物车的数量失败（购买的产品数量小于等于0）" do
        do_request
        puts response_body
        expect(status).to eq(422)
      end
    end

    delete 'cart_items/:id' do

      let(:id) { @cart_items.first.id }

      example "删除（取消）购物车的物品" do
        do_request
        puts response_body
        expect(status).to eq(204)
      end
    end

    # post 'cart_items/pay' do
    #   before do
    #     @cart_items = create_list(:cart_item, 3, user: @user, product: @products.first)
    #   end

    #   parameter :cart_item_ids, "需要支付的购物清单列表", require: true, scope: :cart_item

    #   let(:cart_item_ids) { @cart_items.map(&:id) }

    #   example "支付购物列表成功" do
    #     do_request
    #     puts response_body
    #     expect(status).to eq 201
    #   endZZ
    # end
  end

  describe '用户地址管理相关接口' do
    user_attrs = FactoryGirl.attributes_for(:user)
    contact_attrs = FactoryGirl.attributes_for(:contact)
    # contact_attrs = FactoryGirl.attributes_for(:contact)

    # header "X-User-Token", user_attrs[:authentication_token]
    # header "X-User-Phone", user_attrs[:phone]

    before do
      @user = create(:user)
      @contacts = create_list(:contact, 3, user: @user)
      header "X-User-Token", @user.authentication_token
      header "X-User-Phone", @user.phone
    end

    post 'contacts' do
      parameter :name, "联系人名称", require: true, scope: :contact
      parameter :phone, "联系人电话", require: true, scope: :contact
      parameter :area, "联系人社区所属地区", require: true, scope: :contact
      parameter :street, "联系人社区所属街道", require: true, scope: :contact
      parameter :community, "联系人社区", require: true, scope: :contact
      parameter :address, "联系人地址", require: true, scope: :contact
      parameter :is_default, "是否默认地址", require: true, scope: :contact

      let(:name) { contact_attrs[:name] }
      let(:phone) { contact_attrs[:phone] }
      let(:area) { contact_attrs[:area] }
      let(:street) { contact_attrs[:street] }
      let(:community) { contact_attrs[:community] }
      let(:address) { contact_attrs[:address] }
      let(:is_default) { contact_attrs[:is_default] }

      example "增加一个联系人" do
        do_request
        puts response_body
        expect(status).to eq 201 
      end
    end

    get 'contacts' do

      example "查看用户联系人列表" do
        do_request
        puts response_body
        expect(status).to eq 200
      end
    end

    get 'contacts/:id' do

      let(:id) { @contacts.first.id }

      example "查看用户联系人详情" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    put 'contacts/:id' do

      parameter :name, "联系人名称", require: true, scope: :contact
      parameter :phone, "联系人电话", require: true, scope: :contact
      parameter :area, "联系人社区所属地区", require: true, scope: :contact
      parameter :street, "联系人社区所属街道", require: true, scope: :contact
      parameter :community, "联系人社区", require: true, scope: :contact
      parameter :address, "联系人地址", require: true, scope: :contact
      parameter :is_default, "是否默认地址", require: true, scope: :contact

      let(:name) { contact_attrs[:name] }
      let(:phone) { contact_attrs[:phone] }
      let(:area) { contact_attrs[:area] }
      let(:street) { contact_attrs[:street] }
      let(:community) { contact_attrs[:community] }
      let(:address) { contact_attrs[:address] }
      let(:is_default) { contact_attrs[:is_default] }
      let(:id) { @contacts.first.id }

      example "修改用户联系人信息成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    delete 'contacts/:id' do

      let(:id) { @contacts.first.id }

      example "删除用户联系人信息成功" do
        do_request
        puts response_body
        expect(status).to eq(204)
      end
    end
  end

  describe "商品分类项目相关接口" do
    # user_attrs = FactoryGirl.attributes_for(:user)

    # header "X-User-Token", user_attrs[:authentication_token]
    # header "X-User-Phone", user_attrs[:phone]

    before do
      @user = create(:user)
      @product_sorts = create_list(:product_sort, 3)
      header "X-User-Token", @user.authentication_token
      header "X-User-Phone", @user.phone
    end

    get 'product_sorts' do

      example "查看商品分类项目 列表" do
        do_request
        puts response_body
        expect(status).to eq 200
      end
    end

    # get 'product_sorts/:id' do

    #   example "查看用户联系人列表" do
    #     do_request
    #     puts response_body
    #     expect(status).to eq 200
    #   end
    # end
  end

end