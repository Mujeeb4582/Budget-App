require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe '#Associated tests' do
    it { should belong_to(:user).without_validating_presence }
    it { should have_and_belong_to_many(:categories) }
  end

  describe '#Validations tests' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(50) }
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(0) }
  end
end
