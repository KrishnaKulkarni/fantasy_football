require 'rails_helper'

RSpec.describe "drafts/show", type: :view do
  before(:each) do
    @league = assign(:league, League.create!(
      :name => "LeagueName",
      :size => 2,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/LeagueName/)
    expect(rendered).to match(/2/)
  end
end
