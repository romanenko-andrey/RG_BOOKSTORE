require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Validation' do
    it { should validate_presence_of(:name) }
  end

  context 'Associations' do
    it { should have_many(:books) }
  end
end
