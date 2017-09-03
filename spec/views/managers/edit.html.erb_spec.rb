require 'rails_helper'

RSpec.describe "managers/edit", type: :view do
  before(:each) do
    @manager = assign(:manager, Manager.create!(
      :name => "MyString",
      :league => create(:league),
    ))
  end

  it "renders the edit manager form" do
    render

    assert_select "form[action=?][method=?]", manager_path(@manager), "post" do

      assert_select "input#manager_name[name=?]", "manager[name]"

      assert_select "input#manager_league_id[name=?]", "manager[league_id]"
    end
  end
end
