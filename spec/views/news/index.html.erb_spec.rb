require 'rails_helper'

RSpec.describe "news/index", type: :view do
  before(:each) do
    assign(:news, [
      News.create!(),
      News.create!()
    ])
  end

  it "renders a list of news" do
    render
  end
end
