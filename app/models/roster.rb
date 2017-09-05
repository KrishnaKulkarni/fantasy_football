class Roster < ApplicationRecord
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

  def draft(player, cost)
    players << player
    position = player.position
    count = send(position)
    count -= 1

    update(budget: self.budget - cost, position => count)
  end
end
