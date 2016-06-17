require 'acceptance_helper'

resource "用户注册登录" do
  header "Accept", "application/json"

  post "/users" do
    parameter :phone, "用户注册的手机号码", required: true, scope: :user
    parameter :password, "用户注册的密码", required: true, scope: :user
    parameter :sms_token, "用户注册的短消息验证码", required: true, scope: :user

    user_attrs = FactoryGirl.attributes_for :user
    sms_attrs = FactoryGirl.attributes_for :sms_token

    describe "用户注册成功" do
      let(:phone) { sms_attrs[:phone] }
      let(:password) { user_attrs[:password] }
      let(:sms_token) { sms_attrs[:token] }

      response_field :id, "用户ID"
      response_field :created_at, "创建时间"
      response_field :updated_at, "更新时间"
      response_field :phone, "电话号码"
      response_field :authentication_token, "鉴权Token"

      example "用户注册成功" do
        create :sms_token
        do_request
        puts response_body
        expect(status).to eq(201)
      end
    end

    describe "用户注册失败" do
      let(:phone) { sms_attrs[:phone] }
      let(:password) { user_attrs[:password] }
      let(:sms_token) { sms_attrs[:token] }

      example "用户注册失败（验证码未获取）" do
        do_request
        puts response_body
        expect(status).to eq(422)
      end

      let(:phone) { sms_attrs[:phone] }
      let(:password) { user_attrs[:password] }
      let(:sms_token) { "323232" }

      example "用户注册失败（验证码错误）" do
        create :sms_token
        do_request
        puts response_body
        expect(status).to eq(422)
      end

    end

  end

  post "/users/sign_in" do

    before do
      @user = create(:user)
    end

    parameter :phone, "登录的手机号", required: true, scope: :user
    parameter :password, "登录密码", required: true, scope: :user

    user_attrs = FactoryGirl.attributes_for :user
    let(:phone) { user_attrs[:phone] }
    let(:password) { user_attrs[:password] }

    response_field :id, "用户ID"
    response_field :email, "邮箱"
    response_field :created_at, "创建时间"
    response_field :updated_at, "更新时间"
    response_field :phone, "电话号码"
    response_field :authentication_token, "鉴权Token"

    example "用户登录成功" do
      do_request
      puts response_body
      expect(status).to eq(201)
    end

  end

  # post "sms_tokens/register" do
  #   parameter :phone, "发送手机号", required: true, scope: :sms_token

  #   before do
  #     @user = create(:user)
  #   end

  #   user_attrs = FactoryGirl.attributes_for :user
  #   let(:phone) { user_attrs[:phone] }

  #   response_field :id, "验证码ID"
  #   response_field :phone, "电话号码"

  #   example "发送短信验证码" do
  #     do_request
  #     puts response_body
  #     expect(status).to eq(201)
  #   end

  #   example "用户已经被锁定（发送验证码失败）" do
  #     @user.ban!
  #     do_request
  #     puts response_body
  #     expect(status).to eq(422)
  #   end
  # end

  # post "user_info/check" do
  #   parameter :phone, "手机号", required: true, scope: :user

  #   user_attrs = FactoryGirl.attributes_for(:user)

  #   let(:phone) { user_attrs[:phone] }

  #   example "用户已注册" do
  #     create(:user)
  #     do_request
  #     expect(status).to eq(200)
  #   end

  #   example "用户未注册" do
  #     do_request
  #     expect(status).to eq(200)
  #   end

  # end

  # post "user_info/reset" do
  #   parameter :phone, "手机号", required: true, scope: :user
  #   parameter :password, "密码", required: true, scope: :user
  #   parameter :sms_token, "短消息", required: true, scope: :user

  #   describe "重置密码成功" do
  #     before do
  #       @user = create(:user)
  #     end

  #     user_attrs = FactoryGirl.attributes_for :user
  #     let(:phone) { user_attrs[:phone] }
  #     let(:password) { user_attrs[:password] }
  #     let(:sms_token) { "1981" }

  #     example "用户重置密码成功" do
  #       do_request
  #       # puts response_body
  #       expect(status).to eq(200)
  #     end  
  #   end

  #   describe "重置密码失败" do
  #     user_attrs = FactoryGirl.attributes_for :user
  #     let(:phone) { user_attrs[:phone] }
  #     let(:password) { user_attrs[:password] }
  #     let(:raw_post) { params.to_json }
      
  #     example "用户重置密码失败（用户不存在）" do
  #       do_request
  #       puts response_body
  #       expect(status).to eq(422)
  #     end

  #     let(:sms_token) { "98978" }
  #     example "用户重置密码失败（短信验证码不正确）" do
  #       create(:user)
  #       do_request
  #       puts response_body
  #       expect(status).to eq(422)
  #     end
  #   end
    
  # end

end