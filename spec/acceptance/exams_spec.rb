require "acceptance_helper"

resource "体检相关接口" do
  header "Accept", "application/json"

  user_attrs = FactoryGirl.attributes_for(:user)
  user1_attrs = FactoryGirl.attributes_for(:user1)

  header "X-User-Token", user_attrs[:authentication_token]
  header "X-User-Phone", user_attrs[:phone]

  before do
    @user = create(:user)
    @user_info = create(:user_info, user: @user)
    create(:exam_record2, user_info: @user_info)
    create(:exam_record1, user_info: @user_info)
    create(:exam_record, user_info: @user_info)
  end

  get 'reports' do
    context "获取体检报告成功" do
      example "获取用户的体检报告" do
        do_request
        puts response_body
        expect(status).to eq 200
      end
    end

    context "获取体检报告失败" do
      before do
        @user_info.exam_records.destroy_all
        @user_info.exam_report.destroy
      end
      example "当用户不存在时，获取用户的体检报告" do
        do_request
        puts response_body
        expect(status).to eq 200
      end
    end
  end

  get 'reports' do

  end

  get 'reports/sbp' do
    parameter :page, "页码", required: false
    parameter :per_page, "每页个数", required: false

    let(:page) { 1 }
    let(:per_page) { 10 }

    example "获取用户体检收缩压（sbp）历史列表" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end

  get 'reports/sbp1' do
    parameter :page, "页码", required: false
    parameter :per_page, "每页个数", required: false

    let(:page) { 1 }
    let(:per_page) { 10 }

    example "获取用户体检不存在的体检项历史列表" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end


end