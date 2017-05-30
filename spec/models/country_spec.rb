require 'rails_helper'

RSpec.describe Country, type: :model do
  context 'Validation' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:zip) }
  end
end
