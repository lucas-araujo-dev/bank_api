# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaxCalculator do
  describe '.calculate_value_with_tax' do
    it 'raises NotImplementedError' do
      expect { described_class.calculate(100) }.to raise_error(NotImplementedError)
    end
  end
end
