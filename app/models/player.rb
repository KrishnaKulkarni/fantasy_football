class Player < ApplicationRecord
  enum position: {
    QB: 0,
    RB: 1,
    WR: 2,
    TE: 3,
    DEF: 4,
    K: 5,
  }
  validates :name, :position, :public_value, presence: true

  belongs_to :roster
  belongs_to :league
  validates :league, presence: true
  delegate :name, to: :roster, prefix: true, allow_nil: true
  delegate :name, to: :league, prefix: true
end
