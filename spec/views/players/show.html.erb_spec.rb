require 'rails_helper'

RSpec.describe "players/show", type: :view do
  before(:each) do
    @player = assign(:player, Player.create!(
      :name => "Name",
      :position => 2,
      :private_value => "9.99",
      :public_value => "10.99",
      :roster => nil,
      :league => create(:league, name: "LeagueName"),
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/WR/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/10.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(/LeagueName/)
  end
end
