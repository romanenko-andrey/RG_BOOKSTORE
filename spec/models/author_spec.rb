require 'rails_helper'

RSpec.describe Author, type: :model do
  context 'Validation' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  context 'Association' do
    it { should have_and_belongs_to_many(:books) }
  end

  context 'Before save' do
    subject { create(:author, first_name: 'bill', last_name: 'gates') }

    it 'should capitalize #first_name' do
      expect(subject.first_name).to eq 'Bill'
    end

    it 'should capitalize #last_name' do
      expect(subject.last_name).to eq 'Gates'
    end
  end

  describe '#full_name' do
    it 'should return #first_name + #last_name' do
      expect(subject.full_name).to eq("#{subject.first_name} #{subject.last_name}")
    end
  end
end
