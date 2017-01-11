require "acceptance_helper"

resource "社区相关接口" do
  header "Accept", "application/json"

  before do 
  	@subdistrict = create_list(:subdistrict, 1, province: "云南省", city: "昆明市", district: "五华区", subdistrict: "红云街道")
  	@subdistrict1 = create_list(:subdistrict, 1, province: "云南省", city: "昆明市", district: "五华区", subdistrict: "华山街道")
  	@subdistrict2 = create_list(:subdistrict, 1, province: "云南省", city: "昆明市", district: "盘龙区", subdistrict: "拓东街道")
  	@subdistrict3 = create_list(:subdistrict, 1, province: "云南省", city: "嘻嘻市", district: "五华区", subdistrict: "华山街道")
  	@subdistrict4 = create_list(:subdistrict, 1, province: "福建省", city: "漳州市", district: "哈哈区", subdistrict: "哈哈街道")
  	@subdistricts = @subdistrict.concat(@subdistrict1).concat(@subdistrict2).concat(@subdistrict3).concat(@subdistrict4)
    create_list(:community, 4, subdistrict: @subdistrict.first)

	end

	get 'subdistricts' do 
		example "查看社区列表" do
			do_request
			puts response_body
      expect(status).to eq 200
		end
	end
end