class League < ApplicationRecord
  validates :name, :size, presence: true

  has_many :players
end
