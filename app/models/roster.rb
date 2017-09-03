class Roster < ApplicationRecord
  validates :name, presence: true

  belongs_to :manager
  validates :manager, presence: true
  delegate :name, to: :manager, prefix: true
end
