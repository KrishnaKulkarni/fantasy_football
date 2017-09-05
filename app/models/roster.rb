class Roster < ApplicationRecord
  POSITIONS_NEEDED = {
    QB: 2,
    RB: 4,
    WR: 5,
    TE: 2,
    DEF: 1,
    K: 1,
  }

  SPEND_AMOUNTS = {
    :RB=>[0.015309835367779318, 0.04753143207605029, 0.1507000416500753, 0.41720102340184995],
    :WR=>
    [0.007547359797150401,
     0.023086041732460053,
     0.0598845697913377,
     0.1660648001940619,
     0.4236178811554005],
    :QB=>[0.012037329452095548, 0.07970268253946458],
    :TE=>[0.006531281037315721, 0.06361019191073153],
    :DEF=>[0.008920439202332403],
    :K=>[0.006947781790220927]
  }

  validates :name,
  :budget,
  :RB, # Slots remaining
  :WR,
  :QB,
  :TE,
  :K,
  :DEF,
  presence: true

  belongs_to :manager
  validates :manager, presence: true
  delegate :name, to: :manager, prefix: true

  has_many :players

  def spend_amounts
    initial_ratios = SPEND_AMOUNTS.map do |position, ratios|
      count = send(position)
      ratio = count > 0 ? ratios[send(position) - 1] : 0.0
      [position, ratio]
    end
    sum_of_ratios = initial_ratios.map(&:last).sum
    initial_ratios.map { |position, ratio| [position, budget * ratio / sum_of_ratios] }.to_h
  end

  def draft(player, cost)
    players << player
    position = player.position
    count = send(position)
    count -= 1

    update(budget: self.budget - cost, position => count)
  end
end
