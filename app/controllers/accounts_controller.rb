# frozen_string_literal: true

class AccountsController < ApplicationController
  def show
    @account = Account.find_by!(number: params[:number])

    render partial: 'account', formats: :json
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      render partial: 'account', formats: :json, status: :created
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:account).permit(:number, :balance)
  end
end
