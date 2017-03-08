require "acceptance_helper"

resource "政务直通车 新闻相关接口" do
  header "Accept", "application/json"

  before do
    @subdistrict = create(:subdistrict)
    @user = create(:user, subdistrict: @subdistrict)
    header "X-User-Token", @user.authentication_token
    header "X-User-Phone", @user.phone
    @news_sorts = create_list(:news_sort, 3)
    @news = create_list(:news, 3, 
      news_sort: @news_sorts.first
      )
    create_list(:news, 2, news_sort: @news_sorts.second)
  end

  get 'news_sorts' do
    example "用户 得到新闻分类列表" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end

  get 'news_sorts/:id/news' do
    parameter :page, "页码", required: false
    parameter :per_page, "每页个数", required: false
    
    let(:page) { 1 }
    let(:per_page) { 10 }

    let(:id) { @news_sorts.first.id }

    example "【用户】 得到对应新闻分类下的所有新闻 成功" do
      p @news_sorts
      p'----'
      p @news_sorts.first
      do_request
      puts response_body
      expect(status).to eq 200
    end
    
  end

  get 'news_sorts/:id/news/:id' do 

    let(:news_sort_id) { @news_sorts.first.id } 
    let(:id) { @news_sorts.first.news.first.id }
    
    example "【用户】获取某新闻详情 成功" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end

end