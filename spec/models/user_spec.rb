require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#Associations test' do
    it { should have_many(:categories).dependent(:destroy) }
    it { should have_many(:expenses).dependent(:destroy) }
  end

  describe '#Validations test' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(50) }
  end
end
