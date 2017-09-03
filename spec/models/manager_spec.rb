require 'rails_helper'

RSpec.describe Manager, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to belong_to(:league) }
  it { is_expected.to validate_presence_of(:league) }
end
