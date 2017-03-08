# == Schema Information
#
# Table name: news_sorts
#
#  id         :integer          not null, primary key
#  rank       :integer
#  title      :string(191)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe "NewsSorts", type: :request do
  describe "GET /news_sorts" do
    it "works! (now write some real specs)" do
      get news_sorts_path
      expect(response).to have_http_status(200)
    end
  end
end
