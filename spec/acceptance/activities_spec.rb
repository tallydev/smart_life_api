require "acceptance_helper"

resource "活动相关接口" do
  header "Accept", "application/json"

  user_attrs = FactoryGirl.attributes_for(:user)

  header "X-User-Token", user_attrs[:authentication_token]
  header "X-User-Phone", user_attrs[:phone]

  before do
    @user = create(:user)
  end

  get 'activity/sqhds' do
    
    before do
      @appointments = create_list(:activity_sqhd, 3)
    end

    example "社区活动列表查询" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end

  # post 'appointments' do
  #   parameter :type, "预约的类型【ZHJK:智慧健康】【DZMY:电子猫眼】【ITFW:IT服务】【ITXT:IT学堂】【SQHD:社区活动】【XPSS:新品上市】【ZNJJ:智能家居】", 
  #     require: true, scope: :appointment
  #   parameter :count, "预约的人数", require: false, scope: :appointment
  #   let(:count) { 3 }
  #   let(:type) { "ZHJK" }

  #   example "智慧健康预约" do
  #     do_request
  #     puts response_body
  #     expect(status).to eq 201
  #   end
    
    # let(:type) { "DZMY" }
    # example '电子猫眼预约' do
    #   do_request
    #   puts response_body
    #   expect(status).to eq 201
    # end

    # let(:type) { "ITFW" }
    # example 'IT服务预约' do
    #   do_request
    #   puts response_body
    #   expect(status).to eq 201
    # end

    # let(:type) { "ITXT" }
    # example 'IT学堂预约' do
    #   do_request
    #   puts response_body
    #   expect(status).to eq 201
    # end

    # let(:type) { "SQHD" }
    # example '社区活动预约' do
    #   do_request
    #   puts response_body
    #   expect(status).to eq 201
    # end

    # let(:type) { "XPSS" }
    # example '新品上市预约' do
    #   do_request
    #   puts response_body
    #   expect(status).to eq 201
    # end

    # let(:type) { "ZNJJ" }
    # example '智能家居预约' do
    #   do_request
    #   puts response_body
    #   expect(status).to eq 201
    # end
  end

end