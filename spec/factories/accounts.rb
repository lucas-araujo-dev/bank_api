FactoryBot.define do
  factory :account do
    number { Faker::Number.number(digits: 10) }
    balance { Faker::Number.decimal(l_digits: 2) }
  end
end
