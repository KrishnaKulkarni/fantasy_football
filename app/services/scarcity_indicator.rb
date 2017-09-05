class ScarcityIndicator
  class << self
    def run(league)
      spend_amounts = league.rosters.map(&:spend_amounts)

      Player.positions.keys.each_with_object({}) do |pos, accum|
        accum[pos] = {}

        count_needed = league.rosters.sum(pos)
        accum[pos][:count_needed] = count_needed
        accum[pos][:spend_available] = spend_amounts.map { |am| am[pos.to_sym] }.sum

        accum[pos][:value_available] = league.players.send(pos).ranked.
          limit(count_needed).pluck(:private_value).sum.to_f
        accum[pos][:value_per_spend] = if accum[pos][:spend_available] > 0
                                          accum[pos][:value_available] / accum[pos][:spend_available]
                                        else
                                          0.0
                                        end
      end
    end
  end
end
