FactoryGirl.define do
  factory :country do
    name FFaker::Address.country
    zip '38'
  end
end
