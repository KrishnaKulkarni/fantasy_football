class League < ApplicationRecord
  validates :name, :size, presence: true
end
