require "acceptance_helper"

resource "主页相关接口" do
  header "Accept", "application/json"

  get "banners" do
    before do
      create_list(:banner, 3)
    end

    example "用户获取主页广告列表成功" do
      do_request
      puts response_body
      expect(status).to eq(200)
    end
  end
end