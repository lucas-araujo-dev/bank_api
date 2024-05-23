# frozen_string_literal: true

class TaxCalculator
  def self.calculate(_value)
    raise NotImplementedError, 'You must implement the calculate_value_with_tax method'
  end
end
