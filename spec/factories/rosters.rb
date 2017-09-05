FactoryGirl.define do
  factory :roster do
    transient do
      league { create(:league) }
    end
    manager { create(:manager, league: league) }
    name "MyRoster"
    budget 200
  end
end
