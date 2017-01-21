require "acceptance_helper"

resource "限量销售相关接口" do
  header "Accept", "application/json"
  user_attrs = FactoryGirl.attributes_for(:user)

  header "X-User-Token", user_attrs[:authentication_token]
  header "X-User-Phone", user_attrs[:phone]

  before do
    @user = create(:user)
    @promotions = create_list(:promotion, 5, expiration_time: Time.now.tomorrow)
  end

  get 'promotions' do
    parameter :page, "页码", required: false
    parameter :per_page, "每页个数", required: false
    
    let(:page) { 1 }
    let(:per_page) { 2}

    example "查看 限量销售的商品列表" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end

  get 'promotions/:id' do

    let(:id) { @promotions.first.id }

    example "查看指定 限量销售的商品 详情" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
      
  end  

end


