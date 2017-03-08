require "acceptance_helper"

resource "主页相关接口" do
  header "Accept", "application/json"

  # user_attrs = FactoryGirl.attributes_for(:user)

  # header "X-User-Token", user_attrs[:authentication_token]
  # header "X-User-Phone", user_attrs[:phone]

  before do
    @subdistrict = create(:subdistrict, id: 1)
    @user = create(:user, subdistrict: @subdistrict)
    # 去除分社区 
    [ Sport, Sport::Weekly, Sport::Monthly, Sport::Yearly ].each do |name|
      name.class_exec{
        def self.get_const(id) 
          Object.const_get(name)
        end
      }
    end

    @sports =  create_list(:sport, 3, user: @user)
    create_list(:banner, 2)
    create_list(:home_block, 3, subdistrict: @subdistrict)
    

    header "X-User-Token", @user.authentication_token
    header "X-User-Phone", @user.phone

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