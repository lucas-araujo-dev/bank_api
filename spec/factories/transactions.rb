FactoryBot.define do
  factory :transaction do
    payment_type { 'C' }
    account
    value { 10.00 }
  end
end
