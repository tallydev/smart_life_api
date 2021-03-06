require 'acceptance_helper'

resource "用户注册登录" do
  header "Accept", "application/json"

  before do
    @subdistrict = create(:subdistrict)
    @user = create(:user, subdistrict: @subdistrict)
    header "X-User-Token", @user.authentication_token
    header "X-User-Phone", @user.phone
  end

  get "user_info" do
    # user_attrs = FactoryGirl.attributes_for(:user)
    user_info_attrs = FactoryGirl.attributes_for(:user_info)

    before do
      @user.info.update_attributes(user_info_attrs)
    end

    example "用户查询自己的信息成功" do
      do_request
      puts response_body
      expect(status).to eq(200)
    end

  end

  put "user_info" do
    user_attrs = FactoryGirl.attributes_for(:user)
    user_info_attrs = FactoryGirl.attributes_for(:user_info)
    image_attrs = FactoryGirl.attributes_for(:image, photo_type: "avatar") 

    # header "X-User-Token", user_attrs[:authentication_token]
    # header "X-User-Phone", user_attrs[:phone]

    parameter :nickname, "昵称", require: false, scope: :user_info
    parameter :avatar_attributes, "头像", require: false, scope: :user_info
    parameter :sex, "性别【男: male, 女: female】", require: false, scope: :user_info
    parameter :identity_card, "身份证号码", require: false, scope: :user_info
    parameter :birth, "生日", require: false, scope: :user_info
    parameter :slogan, "个性签名", require: false, scope: :user_info
    parameter :pay_password, "支付密码", require: false, scope: :user_info
    parameter :community, "小区名称", require: false, scope: :user_info

    parameter :subdistrict_id, "社区街道id", require: true, scope: :user


    let(:nickname) { "new nickname" }
    let(:identity_card) { "350802182371823" }
    let(:sex) { "female" }
    let(:birth) { "2008-5-28" }
    let(:slogan) { "new slogan" }
    let(:pay_password) { "123456" }
    let(:avatar_attributes) { image_attrs }
    let(:community) { "哈哈哈小区" }
    let(:subdistrict_id) { @subdistrict.id }

    example "用户修改自己的信息成功" do
      do_request
      puts response_body
      expect(status).to eq(200)
    end

  end

end