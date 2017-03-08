require 'rails_helper'

RSpec.describe "news_sorts/index", type: :view do
  before(:each) do
    assign(:news_sorts, [
      NewsSort.create!(),
      NewsSort.create!()
    ])
  end

  it "renders a list of news_sorts" do
    render
  end
end
