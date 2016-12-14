require 'acceptance_helper'

resource "ping++平台支付相关" do
  header "Accept", "application/json"

  post '/get_pingpp_pay_order' do
    parameter :channel, "支付渠道. alipay 支付宝App; wx 微信App ",required: true
    # parameter :openid, "用户openid", required: true
    parameter :amount, "金额, 100=1元", required: true
    parameter :subject, "", required: true
    parameter :body, "", required: true
    parameter :metadata, '其他描述，键值对，例：\'{}\'', required: false
    

    let(:channel) { 'alipay' }
    # let(:openid) { "olclvwHtOBENZ-rLA2NxsBCVZky0" }
    let(:amount) { "100" }
    let(:subject) { "充值" }
    let(:body) { "余额充值" }
    # let(:metadata) { '{"detail":"裤子*2 衣服*4"}' }

    example "向ping++平台请求支付凭证" do
      do_request
      puts response_body
      expect(status).to eq(200)
     end
  end

end