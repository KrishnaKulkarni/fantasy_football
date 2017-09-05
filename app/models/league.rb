class League < ApplicationRecord
  validates :name, :size, presence: true

  has_many :players
  has_many :managers
  has_many :rosters, through: :managers
end
