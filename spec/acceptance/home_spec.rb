require "acceptance_helper"

resource "主页相关接口" do
  header "Accept", "application/json"

  user_attrs = FactoryGirl.attributes_for(:user)

  header "X-User-Token", user_attrs[:authentication_token]
  header "X-User-Phone", user_attrs[:phone]

  before do
    create(:user)
    create_list(:banner, 2)
  end

  get 'home' do
    example "用户获取主页 步数" do
      do_request
      puts response_body
      expect(status).to eq(200)
    end
  end

  get 'home_info' do
    example "用户获取主页的其他信息" do
      do_request
      puts response_body
      expect(status).to eq(200)
    end
  end
end