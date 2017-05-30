require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
  end

  describe 'Validation' do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:items) }
    it { should validate_presence_of(:discont) }
    it { should validate_presence_of(:total_cost) }
    it { should validate_presence_of(:delivery_methods) }
    it { should validate_presence_of(:delivery_cost) }
    it { should validate_presence_of(:card_number) }
  end
end
