require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject { build(:transaction) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:payment_type) }
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_numericality_of(:value).is_greater_than(0) }
    it { is_expected.to validate_presence_of(:account) }

    describe '#value_must_be_less_than_balance' do
      context 'when account is nil' do
        before do
          subject.account = nil
          subject.valid?
        end

        it 'does not add error' do
          expect(subject.errors[:value_with_tax]).to be_empty
        end
      end

      context 'when value_with_tax is greater than balance' do
        before do
          subject.account.balance = 10
          subject.value = 20
          subject.valid?
        end

        it 'adds error' do
          expect(subject.errors[:value_with_tax]).to include('cannot be greater than balance')
        end
      end

      context 'when value_with_tax is less than balance' do
        before do
          subject.account.balance = 10
          subject.value = 5
          subject.valid?
        end

        it 'does not add error' do
          expect(subject.errors[:value_with_tax]).to be_empty
        end
      end
    end
  end

  describe 'callbacks' do
    describe '#set_value_with_tax' do
      context 'when value and payment_type are present' do
        before do
          subject.value = 10
          subject.payment_type = 'C'
          subject.send(:set_value_with_tax)
        end

        it 'sets value_with_tax' do
          expect(subject.value_with_tax).to eq(10.5)
        end
      end

      context 'when value is blank' do
        before do
          subject.value = nil
          subject.payment_type = 'C'
          subject.send(:set_value_with_tax)
        end

        it 'does not set value_with_tax' do
          expect(subject.value_with_tax).to be_nil
        end
      end

      context 'when payment_type is blank' do
        before do
          subject.value = 10
          subject.payment_type = nil
          subject.valid?
        end

        it 'does not set value_with_tax' do
          expect(subject.value_with_tax).to be_nil
        end
      end
    end
  end

  describe 'transaction create' do
    before { subject.save }

    it { is_expected.to be_persisted }
  end
end
