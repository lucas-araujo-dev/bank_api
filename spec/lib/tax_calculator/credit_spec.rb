# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TaxCalculator::Credit do
  describe '.calculate' do
    it 'calculates the value with tax' do
      expect(described_class.calculate(100)).to eq(105)
    end
  end
end
