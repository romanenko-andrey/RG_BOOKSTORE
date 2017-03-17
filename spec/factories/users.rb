FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    name { FFaker::Name.first_name }
    password { FFaker::Internet.password(8) }
  end

  factory :admin, class: User do
    name { FFaker::Internet.email }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password(8) }
    admin  true
  end


end

