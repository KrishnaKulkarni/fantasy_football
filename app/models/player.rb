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

  belongs_to :roster, required: false
  belongs_to :league
  delegate :name, to: :roster, prefix: true, allow_nil: true
  delegate :name, to: :league, prefix: true

  scope :available, -> { where.not(private_value: nil).where(roster_id: nil) }
  scope :ranked, -> { available.order(public_value: :desc) }
end
