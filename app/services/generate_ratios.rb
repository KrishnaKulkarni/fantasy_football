class GenerateRatios
  class << self
    def positions
      Roster::POSITIONS_NEEDED
    end

    def run
      avg_spend = {}
      positions.each { |position, count| add_avg_values!(avg_spend, position, count) }

      sum_avg = avg_spend.values.flatten.sum
      ratio_spend = avg_spend.map do |position, avgs|
        [position, avgs.map { |avg| avg / sum_avg }]
      end.to_h

      positions.each_with_object({}) do |(position, count), accum|
        accum[position] = []

        count.times do |i|
          accum[position] << ratio_spend[position].last(i + 1).sum
        end
      end
    end

    def add_avg_values!(accum, position, num)
      accum[position] = []
      num.times { |i| accum[position] << avg_value(position, i) }
    end

    def avg_value(position, offset_idx)
      Player.send(position).ranked.limit(12).
        offset(offset_idx * 12).pluck(:public_value).sum.to_f / 12.0
    end
  end
end
