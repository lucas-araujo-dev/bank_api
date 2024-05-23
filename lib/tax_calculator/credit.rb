# frozen_string_literal: true

class TaxCalculator::Credit < TaxCalculator
  def self.calculate(value)
    value * 1.05
  end
end
