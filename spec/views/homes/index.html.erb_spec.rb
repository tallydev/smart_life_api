require 'rails_helper'

RSpec.describe "homes/index", type: :view do
  before(:each) do
    assign(:homes, [
      Home.create!(
        :index => "Index"
      ),
      Home.create!(
        :index => "Index"
      )
    ])
  end

  it "renders a list of homes" do
    render
    assert_select "tr>td", :text => "Index".to_s, :count => 2
  end
end
