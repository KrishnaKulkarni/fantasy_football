require 'rails_helper'

RSpec.describe "players/index", type: :view do
  before(:each) do
    assign(:players, [
      Player.create!(
        :name => "Name",
        :position => 2,
        :private_value => "9.99",
        :public_value => "10.99",
        :roster => nil,
        :league => create(:league, name: "LeagueName"),
      ),
      Player.create!(
        :name => "Name",
        :position => 2,
        :private_value => "9.99",
        :public_value => "10.99",
        :roster => nil,
        :league => create(:league, name: "LeagueName"),
      )
    ])
  end

  it "renders a list of players" do
    render
    assert_select "tr>td", :text => "Name", :count => 2
    assert_select "tr>td", :text => "WR", :count => 2
    assert_select "tr>td", :text => "9.99", :count => 2
    assert_select "tr>td", :text => "10.99", :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "LeagueName", :count => 2
  end
end
