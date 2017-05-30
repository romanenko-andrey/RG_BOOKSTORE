require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  context 'validation' do
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_most(63) }
    it { should validate_length_of(:password).is_at_least(8) }
  end

  context 'Associations' do
    it { should have_many(:reviews).dependent(:destroy) }
    it { should have_many(:orders).dependent(:destroy) }
    it { should have_many(:billing_address).dependent(:destroy) }
    it { should have_many(:shipping_address).dependent(:destroy) }
  end

  context 'user must have required fields' do
    it { is_expected.to respond_to(:password) }
    it { is_expected.to respond_to(:admin) }
    it { expect(user.admin?).to be_falsey }
    it { is_expected.to respond_to(:orders) }
    it { is_expected.to respond_to(:billing_address) }
    it { is_expected.to respond_to(:shipping_address) }
  end

  context 'User must have has_secure_password' do
    it 'only users with passwords will be persisted' do
      expect(User.new(email: 'test@test.ua').save).to be_falsey
      expect(User.new(email: 'test@test.ua', password: 'goodPass!!').save).to be_truthy
    end
    it 'only access user with a valid password' do
      expect(User.find_by(email: user.email).valid_password?('invalid_pass')).to be_falsey
      expect(User.find_by(email: user.email).valid_password?(user.password)).to be_truthy
    end
    it 'password confirmation must match password to persist a user' do
      expect(User.new(email: 'test@test.ua', password: 'goodPass!!', password_confirmation: 'notsame').save).to be_falsey
      expect(User.new(email: 'test@test.ua', password: 'goodPass!!', password_confirmation: 'goodPass!!').save).to be_truthy
    end
  end
end
