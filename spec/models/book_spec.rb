require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'Validation' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:public_year) }
    it { should validate_presence_of(:dimensions) }
    it { should validate_presence_of(:materials) }
    it { should validate_presence_of(:public_year) }
    it { should validate_presence_of(:public_year) }
    it { should validate_length_of(:description).is_at_most(2000) }
    it { should validate_length_of(:short_description).is_at_most(500) }
    it { should validate_numericality_of(:price).is_greater_than(0) }  
  end

  context 'Associations' do
    it { should belong_to(:category) }
    it { should have_many(:reviews) } 
    it { should have_many(:photos) }
    it { should have_and_belongs_to_many(:authors) }
  end
end
