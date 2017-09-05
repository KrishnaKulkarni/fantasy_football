require 'rails_helper'

RSpec.describe BidPredictor do
  it "EX1" do
    league = create(:league)

    roster1 = create(:roster, league: league, budget: 200, RB: 1, WR: 1)

    rb1 = create(:player, league: league,
                position: "RB", public_value: 60.0)
    wr1 = create(:player, league: league,
                position: "WR", public_value: 40.0)


    expect(described_class.predict(league)).to match_array([
      [roster1.id, "QB", 0],
      [roster1.id, "RB", 120],
      [roster1.id, "WR", 80],
      [roster1.id, "TE", 0],
      [roster1.id, "DEF", 0],
      [roster1.id, "K", 0],
    ])
  end

  it "EX2" do
    league = create(:league)

    roster1 = create(:roster, league: league, budget: 200, RB: 1)
    roster2 = create(:roster, league: league, budget: 190, RB: 1)

    rb1 = create(:player, league: league,
                position: "RB", public_value: 60.0)
    rb2 = create(:player, league: league,
                position: "RB", public_value: 59.0)

    expect(described_class.predict(league)).to match_array([
      [roster1.id, "QB", 0],
      [roster1.id, "RB", 200],
      [roster1.id, "WR", 0],
      [roster1.id, "TE", 0],
      [roster1.id, "DEF", 0],
      [roster1.id, "K", 0],

      [roster1.id, "QB", 0],
      [roster1.id, "RB", 190],
      [roster1.id, "WR", 0],
      [roster1.id, "TE", 0],
      [roster1.id, "DEF", 0],
      [roster1.id, "K", 0],
    ])
  end

  it "EX3" do
    league = create(:league)

    roster1 = create(:roster, league: league, budget: 200, RB: 1, WR: 1)
    roster2 = create(:roster, league: league, budget: 150, RB: 1)

    rb1 = create(:player, league: league,
                position: "RB", public_value: 60.0)
    rb2 = create(:player, league: league,
                position: "RB", public_value: 40.0)
    wr1 = create(:player, league: league,
                position: "WR", public_value: 40.0)

    expect(described_class.predict(league)).to match_array([
      [roster1.id, "QB", 0],
      [roster1.id, "RB", 120],
      [roster1.id, "WR", 80],
      [roster1.id, "TE", 0],
      [roster1.id, "DEF", 0],
      [roster1.id, "K", 0],

      [roster2.id, "QB", 0],
      [roster2.id, "RB", 150],
      [roster2.id, "WR", 0],
      [roster2.id, "TE", 0],
      [roster2.id, "DEF", 0],
      [roster2.id, "K", 0],
    ])
  end
end
