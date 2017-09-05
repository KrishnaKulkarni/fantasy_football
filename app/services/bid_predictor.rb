class BidPredictor
  class << self
    def predict(league)
      positions = Player.positions.keys
      budgets = league.rosters.select(:id, :budget, *positions)

      supply_values = positions.each_with_object({}) do |position, hash|
        num_players_needed = budgets.sum(position)
        market_supply_value = league.players.send(position).available.
          limit(num_players_needed).sum(:public_value)

        hash[position] = market_supply_value
      end

      budgets.map do |b|
        aggregate_personal_demand = 0.0

        personal_demands = positions.map do |p|
          players_needed = b.send(p)
          available_value = supply_values[p]

          personal_demand = players_needed * available_value
          aggregate_personal_demand += personal_demand

          [p, personal_demand]
        end

        personal_demands.map do |position, demand|
          [b.id, position, (b.budget * demand / aggregate_personal_demand).to_i]
        end
      end.flatten(1)
    end
  end
end
