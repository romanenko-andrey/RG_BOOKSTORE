require 'rails_helper'

describe "BillingAddress & ShippingAddress" do
  
  let(:user) { create :user }

  context 'associations' do
    it 'belong to user' do 
      expect(BillingAddress.find_by(user: user.id).id).to eq(user.billing_address.id)
    end
  end

  context 'user has all types of addresses' do
    before do
      user.billing_address = create(:billing_address, first_name: 'John') 
      user.shipping_address = create(:shipping_address, last_name: 'Smith') 
    end
    it 'billing address' do
      expect(User.find_by(email: user.email).billing_address.first_name).to eq('John')
    end
    it 'shipping address' do
      expect(User.find_by(:email => user.email).shipping_address.last_name).to eq('Smith')
    end
  end


end
