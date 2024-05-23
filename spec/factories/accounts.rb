FactoryBot.define do
  factory :account do
    number { Faker::Number.number(digits: 10) }
    balance { 100.00 }
  end
end
