require "acceptance_helper"

resource "客服信息相关接口" do
  header "Accept", "application/json"
  # user_attrs = FactoryGirl.attributes_for(:user)

  # header "X-User-Token", user_attrs[:authentication_token]
  # header "X-User-Phone", user_attrs[:phone]
  before do
  	@user = create(:user)
    @customer_services = create_list(:customer_service, 3)
    header "X-User-Token", @user.authentication_token
    header "X-User-Phone", @user.phone
  end

  get 'customer_services' do
    example "查看客服信息列表" do
     
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end

  get 'customer_services/:id' do
  	let(:id) { @customer_services.first.id } 

    example "查看客服信息详情" do
      # header "X-User-Token", @user.authentication_token
      # header "X-User-Phone", @user.phone
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end
end