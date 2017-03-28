require 'rails_helper'

RSpec.describe Coupon, type: :model do
  context 'Validation' do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:discont) }
    it { should validate_presence_of(:status) }
  end
end
