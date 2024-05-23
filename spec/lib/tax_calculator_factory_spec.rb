# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'TaxCalculatorFactory' do
  describe '.create' do
    context 'when payment type is credit' do
      it 'returns the Credit calculator' do
        expect(TaxCalculatorFactory.create('C')).to eq(TaxCalculator::Credit)
      end
    end

    context 'when payment type is debit' do
      it 'returns the Debit calculator' do
        expect(TaxCalculatorFactory.create('D')).to eq(TaxCalculator::Debit)
      end
    end

    context 'when payment type is pix' do
      it 'returns the Pix calculator' do
        expect(TaxCalculatorFactory.create('P')).to eq(TaxCalculator::Pix)
      end
    end

    context 'when payment type is invalid' do
      it 'raises an error' do
        expect { TaxCalculatorFactory.create('X') }.to raise_error('Invalid payment method')
      end
    end
  end
end
