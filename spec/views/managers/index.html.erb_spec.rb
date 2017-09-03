require 'rails_helper'

RSpec.describe "managers/index", type: :view do
  before(:each) do
    assign(:managers, [
      Manager.create!(
        :name => "Name",
        :league => create(:league, name: "LeagueName"),
      ),
      Manager.create!(
        :name => "Name",
        :league => create(:league, name: "LeagueName"),
      )
    ])
  end

  it "renders a list of managers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "LeagueName".to_s, :count => 2
  end
end
