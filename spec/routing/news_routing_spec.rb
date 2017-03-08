# == Schema Information
#
# Table name: news
#
#  id             :integer          not null, primary key
#  news_sort_id   :integer
#  title          :string(191)
#  content        :text(65535)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer
#
# Indexes
#
#  fk_rails_5785f550fc         (subdistrict_id)
#  index_news_on_news_sort_id  (news_sort_id)
#

require "rails_helper"

RSpec.describe NewsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/news").to route_to("news#index")
    end

    it "routes to #new" do
      expect(:get => "/news/new").to route_to("news#new")
    end

    it "routes to #show" do
      expect(:get => "/news/1").to route_to("news#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/news/1/edit").to route_to("news#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/news").to route_to("news#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/news/1").to route_to("news#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/news/1").to route_to("news#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/news/1").to route_to("news#destroy", :id => "1")
    end

  end
end
