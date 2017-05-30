FactoryGirl.define do
  factory :billing_address do
    first_name { FFaker::Name.first_name }
    last_name  { FFaker::Name.last_name }
    addressee  { FFaker::Address.street_name }
    city       { FFaker::Address.city }
    zip        { 49_000 }
    phone      { '+380501112233' }
    country    { create(:country).id }

    trait :invalid do
      first_name nil
    end
  end

  factory :shipping_address do
    first_name { FFaker::Name.first_name }
    last_name  { FFaker::Name.last_name }
    addressee  { FFaker::Address.street_name }
    city       { FFaker::Address.city }
    zip        { 49_000 }
    phone      { '+380501112233' }
    country    { create(:country).id }

    trait :invalid do
      zip ''
    end
  end
end
