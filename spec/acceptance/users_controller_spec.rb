require 'acceptance_helper'

resource '用户接口' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  post '/users' do
    before(:each) do

    end
    parameter :phone, 'Phone', required: true, scope: :user
    parameter :password, 'Password', required: true, scope: :user

    user_attrs = FactoryGirl.attributes_for :user
    let(:phone) { user_attrs[:phone] }
    let(:password) { user_attrs[:password] }
    let(:raw_post) { params.to_json }

    response_field :result, '结果'
    response_field :salt, 'salt'
    example '注册成功' do
      do_request

      expect(status).to eq(200)
    end
  end

  post '/users' do
    before(:each) do
      @user = create(:user)
    end
    parameter :phone, 'Phone', required: true, scope: :user
    parameter :password, 'Password', required: true, scope: :user

    user_attrs = FactoryGirl.attributes_for :user
    let(:phone) { user_attrs[:phone] }
    let(:password) { '123123' }
    let(:raw_post) { params.to_json }

    response_field :result, '结果'
    response_field :salt, 'salt'
    example '注册失败' do
      do_request

      expect(status).to eq(200)
    end
  end

  post '/users/sign_in' do
    before(:each) do
      @user = create(:user)
    end
    parameter :phone, 'Phone', required: true, scope: :user
    parameter :password, 'Password', required: true, scope: :user
    
    user_attrs = FactoryGirl.attributes_for :user
    let(:phone) { user_attrs[:phone] }
    let(:password) { user_attrs[:password] }
    let(:raw_post) { params.to_json }

    response_field :result, '结果'
    response_field :salt, 'salt'
    example '登录成功' do
      do_request

      expect(status).to eq(200)
    end
  end
end
