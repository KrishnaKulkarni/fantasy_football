require 'rails_helper'

RSpec.describe "rosters/edit", type: :view do
  before(:each) do
    @roster = assign(:roster, Roster.create!(
      :name => "MyString",
      :manager => create(:manager),
      :structure => ""
    ))
  end

  it "renders the edit roster form" do
    render

    assert_select "form[action=?][method=?]", roster_path(@roster), "post" do

      assert_select "input#roster_name[name=?]", "roster[name]"

      assert_select "input#roster_manager_id[name=?]", "roster[manager_id]"

      assert_select "input#roster_structure[name=?]", "roster[structure]"
    end
  end
end
