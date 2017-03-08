# == Schema Information
#
# Table name: news_sorts
#
#  id             :integer          not null, primary key
#  rank           :integer
#  title          :string(191)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subdistrict_id :integer
#
# Indexes
#
#  fk_rails_97499036d9  (subdistrict_id)
#

require "rails_helper"

RSpec.describe NewsSortsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/news_sorts").to route_to("news_sorts#index")
    end

    it "routes to #new" do
      expect(:get => "/news_sorts/new").to route_to("news_sorts#new")
    end

    it "routes to #show" do
      expect(:get => "/news_sorts/1").to route_to("news_sorts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/news_sorts/1/edit").to route_to("news_sorts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/news_sorts").to route_to("news_sorts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/news_sorts/1").to route_to("news_sorts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/news_sorts/1").to route_to("news_sorts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/news_sorts/1").to route_to("news_sorts#destroy", :id => "1")
    end

  end
end
