FactoryGirl.define do
  factory :review do
    title  { FFaker::Lorem.phrase }
    text   { FFaker::Lorem.phrase }
    rating { rand(0..5) }

    trait :approved do
      status 'approved'
    end

    trait :rejected do
      status 'rejected'
    end
  end
end
