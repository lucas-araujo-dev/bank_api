# frozen_string_literal: true

class TaxCalculator::Debit < TaxCalculator
  def self.calculate(value)
    value * 1.03
  end
end
