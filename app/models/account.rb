# frozen_string_literal: true

class Account < ApplicationRecord
  has_many :transactions

  with_options presence: true do
    validates :number, uniqueness: true
    validates :balance, numericality: { greater_than_or_equal_to: 0 }
  end
end
