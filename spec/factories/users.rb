FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@example.com" }
    password { '12345678' }
  end
end
