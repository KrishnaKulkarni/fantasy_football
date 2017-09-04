require 'rails_helper'

RSpec.describe "Draft", type: :request do
  describe "GET /leagues/:league_id/draft" do
    it "responds with 200 for the draft" do
      league = create(:league)
      get league_draft_path(league)
      expect(response).to have_http_status(200)
    end
  end
end
