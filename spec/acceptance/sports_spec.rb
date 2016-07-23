require "acceptance_helper"

resource "运动相关接口" do
  header "Accept", "application/json"

  user_attrs = FactoryGirl.attributes_for(:user)

  header "X-User-Token", user_attrs[:authentication_token]
  header "X-User-Phone", user_attrs[:phone]

  before do
    create(:user)
  end

  post 'sports' do
    parameter :date, "用户所属的天", require: true, scope: :sport
    parameter :count, "用户当天运动的步数", require: true, scope: :sport
    let(:count) { 300 }
    let(:date) { Time.zone.today }

    example "用户提交当天的运动步数" do
      do_request
      puts response_body
      expect(status).to eq 201
    end
  end

end