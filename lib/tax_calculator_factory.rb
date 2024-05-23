# frozen_string_literal: true

class TaxCalculatorFactory
  def self.create(payment_type)
    case payment_type
    when 'C'
      TaxCalculator::Credit
    when 'D'
      TaxCalculator::Debit
    when 'P'
      TaxCalculator::Pix
    else
      raise 'Invalid payment method'
    end
  end
end
