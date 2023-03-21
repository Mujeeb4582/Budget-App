require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '#Association tests' do
    it { should belong_to(:user) }
    it { should have_and_belong_to_many(:expenses) }
  end

  describe '#Validations tests' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(50) }
    it { should validate_presence_of(:icon) }
  end
end
