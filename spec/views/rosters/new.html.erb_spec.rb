require 'rails_helper'

RSpec.describe "rosters/new", type: :view do
  before(:each) do
    assign(:roster, Roster.new(
      :name => "MyString",
      :manager => nil,
      :structure => ""
    ))
  end

  it "renders new roster form" do
    render

    assert_select "form[action=?][method=?]", rosters_path, "post" do

      assert_select "input#roster_name[name=?]", "roster[name]"

      assert_select "input#roster_manager_id[name=?]", "roster[manager_id]"

      assert_select "input#roster_structure[name=?]", "roster[structure]"
    end
  end
end
