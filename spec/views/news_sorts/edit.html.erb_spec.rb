require 'rails_helper'

RSpec.describe "news_sorts/edit", type: :view do
  before(:each) do
    @news_sort = assign(:news_sort, NewsSort.create!())
  end

  it "renders the edit news_sort form" do
    render

    assert_select "form[action=?][method=?]", news_sort_path(@news_sort), "post" do
    end
  end
end
