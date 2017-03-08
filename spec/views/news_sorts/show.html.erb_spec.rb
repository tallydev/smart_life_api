require 'rails_helper'

RSpec.describe "news_sorts/show", type: :view do
  before(:each) do
    @news_sort = assign(:news_sort, NewsSort.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
