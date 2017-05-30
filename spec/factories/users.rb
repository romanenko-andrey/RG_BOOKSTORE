FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    password { FFaker::Internet.password(8) }
  end

  factory :admin, class: User do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password(8) }
    admin true
  end
end
