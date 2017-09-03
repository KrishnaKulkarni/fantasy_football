require 'rails_helper'

RSpec.describe "rosters/show", type: :view do
  before(:each) do
    @roster = assign(:roster, Roster.create!(
      :name => "Name",
      :manager => nil,
      :structure => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
