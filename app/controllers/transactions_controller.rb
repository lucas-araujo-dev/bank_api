# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :set_account

  def create
    @transaction = @account.transactions.new(transaction_params)
    if @transaction.save
      render partial: 'accounts/account', formats: :json, status: :created
    else
      render json: @transaction.errors, status: :not_found
    end
  end

  private

  def set_account
    @account = Account.find_by!(number: params.dig(:transaction, :account_number))
  end

  def transaction_params
    params.require(:transaction).permit(:payment_type, :value)
  end
end
