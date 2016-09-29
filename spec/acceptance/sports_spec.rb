require "acceptance_helper"

resource "运动相关接口" do
  header "Accept", "application/json"

  user_attrs = FactoryGirl.attributes_for(:user)
  user1_attrs = FactoryGirl.attributes_for(:user1)

  header "X-User-Token", user_attrs[:authentication_token]
  header "X-User-Phone", user_attrs[:phone]

  before do
    @user = create(:user)
    @user1 = create(:user1)
    create(:user_info, user: @user)
    create(:user_info, user: @user1)
    create(:sport, user: @user, date: Time.zone.today-1, count: 100)
    create(:sport, user: @user, date: Time.zone.today, count: 500)
    create(:sport, user: @user1, date: Time.zone.today-1, count: 500)
    create(:sport, user: @user1, date: Time.zone.today, count: 300)
  end

  post 'sports' do
    parameter :date, "用户所属的天", require: true, scope: :sport
    parameter :count, "用户当天运动的步数", require: true, scope: :sport
    let(:count) { 600 }
    let(:date) { Time.zone.today }

    example "用户提交当天的运动步数" do
      do_request
      puts response_body
      expect(status).to eq 201
    end
  end

  get 'sports/daily' do
    example "获取用户当日运动的统计信息" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end

  get 'sports/weekly' do
    example "获取用户本周运动的统计信息" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end

  get 'sports/monthly' do
    example "获取用户本月运动的统计信息" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end

  get 'sports/yearly' do
    example "获取用户本年运动的统计信息" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end

  get 'ranks/daily' do
    parameter :page, "页码", required: false
    parameter :per_page, "每页个数", required: false

    let(:page) { 1 }
    let(:per_page) { 10 }

    example "获取用户当日运动的排名信息" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end

  get 'ranks/weekly' do
    parameter :page, "页码", required: false
    parameter :per_page, "每页个数", required: false

    let(:page) { 1 }
    let(:per_page) { 10 }
    
    example "获取用户本周运动的的排名信息" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end

  get 'ranks/monthly' do
    parameter :page, "页码", required: false
    parameter :per_page, "每页个数", required: false

    let(:page) { 1 }
    let(:per_page) { 10 }
    
    example "获取用户本月运动的的排名信息" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end

  get 'ranks/weekly' do
    parameter :page, "页码", required: false
    parameter :per_page, "每页个数", required: false

    let(:page) { 1 }
    let(:per_page) { 10 }
    
    example "获取用户本年运动的的排名信息" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end


end