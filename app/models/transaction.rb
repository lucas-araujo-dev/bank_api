class Transaction < ApplicationRecord
  belongs_to :account

  enum payment_type: { C: 0, D: 1, P: 2 }

  with_options presence: true do
    validates :value, numericality: { greater_than: 0 }
    validates :account, :payment_type, :value_with_tax
  end

  validate :value_must_be_less_than_balance

  before_validation :set_value_with_tax

  private

  def set_value_with_tax
    return if value.blank? || payment_type.blank?

    tax_calculator_class = TaxCalculatorFactory.create(payment_type)
    self.value_with_tax = tax_calculator_class.calculate_value_with_tax(value)
  end

  def value_must_be_less_than_balance
    return if account.nil?
    return if value_with_tax.nil? || value_with_tax < account.balance

    errors.add(:value_with_tax, 'cannot be greater than balance')
  end
end
