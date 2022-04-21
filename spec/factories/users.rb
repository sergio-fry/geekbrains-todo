FactoryBot.define do
  factory :user do
    name { "Ivan" }
    role { Role.find_by code: :user }

    sequence(:email) { |n| "test#{n}@example.com" }

    trait :admin do
      role { Role.find_by code: :admin }
    end
  end
end