require "rails_helper"

RSpec.describe DraftsController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(:get => "leagues/1/draft").to route_to("drafts#show", :league_id => "1")
    end
  end
end
