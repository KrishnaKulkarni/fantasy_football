require 'rails_helper'

RSpec.describe "rosters/index", type: :view do
  before(:each) do
    assign(:rosters, [
      Roster.create!(
        :name => "Name",
        :manager => create(:manager, name: "ManagerName"),
        :structure => ""
      ),
      Roster.create!(
        :name => "Name",
        :manager => create(:manager, name: "ManagerName"),
        :structure => ""
      )
    ])
  end

  it "renders a list of rosters" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "ManagerName".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
