class Transaction < ApplicationRecord
  belongs_to :account

  enum payment_type: { credit: 'C', debit: 'D', pix: 'P' }

  with_options presence: true do
    validates :value, numericality: { greater_than: 0 }
    validates :account, :payment_type
  end

  before_commit :set_value_with_tax

  validate :value_must_be_less_than_balance

  private

  def value_must_be_less_than_balance
    return if account.nil?

    errors.add(:value, 'cannot be greater than balance')
  end
end
