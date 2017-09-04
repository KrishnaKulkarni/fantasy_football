require 'rails_helper'

RSpec.describe "players/index", type: :view do
  before(:each) do
    assign(:players, [
      Player.create!(
        :name => "Name",
        :position => 2,
        :private_value => "9.99",
        :public_value => "9.99",
        :roster => nil,
        :league => nil
      ),
      Player.create!(
        :name => "Name",
        :position => 2,
        :private_value => "9.99",
        :public_value => "9.99",
        :roster => nil,
        :league => nil
      )
    ])
  end

  it "renders a list of players" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
