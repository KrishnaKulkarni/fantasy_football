require 'rails_helper'

RSpec.describe Roster, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to belong_to(:manager) }
  it { is_expected.to validate_presence_of(:manager) }
end
