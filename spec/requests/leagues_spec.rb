require 'rails_helper'

RSpec.describe "Leagues", type: :request do
  describe "GET /leagues" do
    it "works! (now write some real specs)" do
      get leagues_path
      expect(response).to have_http_status(200)
    end
  end
end
