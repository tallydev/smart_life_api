require "acceptance_helper"

resource "商品相关接口" do
  header "Accept", "application/json"

  get 'products' do
    before do
      @products = create_list(:product, 3)
    end

    example "查看商品列表" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
  end

  get 'products/:id' do
    before do
      @product = create(:product)
    end
    let(:id) { @product.id }

    example "查看指定商品详情" do
      do_request
      puts response_body
      expect(status).to eq 200
    end
    
  end

end