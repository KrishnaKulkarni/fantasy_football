require 'rails_helper'

RSpec.describe "players/new", type: :view do
  before(:each) do
    assign(:player, Player.new(
      :name => "MyString",
      :position => 1,
      :private_value => "9.99",
      :public_value => "9.99",
      :roster => nil,
      :league => nil
    ))
  end

  it "renders new player form" do
    render

    assert_select "form[action=?][method=?]", players_path, "post" do

      assert_select "input#player_name[name=?]", "player[name]"

      assert_select "input#player_position[name=?]", "player[position]"

      assert_select "input#player_private_value[name=?]", "player[private_value]"

      assert_select "input#player_public_value[name=?]", "player[public_value]"

      assert_select "input#player_roster_id[name=?]", "player[roster_id]"

      assert_select "input#player_league_id[name=?]", "player[league_id]"
    end
  end
end
