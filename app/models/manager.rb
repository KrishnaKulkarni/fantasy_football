class Manager < ApplicationRecord
  validates :name, presence: true

  belongs_to :league
  validates :league, presence: true
  has_many :rosters
  delegate :name, to: :league, prefix: true
end
