require 'rails_helper'

RSpec.describe "news_sorts/new", type: :view do
  before(:each) do
    assign(:news_sort, NewsSort.new())
  end

  it "renders new news_sort form" do
    render

    assert_select "form[action=?][method=?]", news_sorts_path, "post" do
    end
  end
end
