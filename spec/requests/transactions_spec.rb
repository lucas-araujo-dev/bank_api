# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Transactions' do
  let(:account) { create(:account) }

  describe 'POST #create' do
    let(:do_request) { post transactions_path(params) }

    context 'with valid parameters' do
      let(:params) do
        { transaction: { account_number: account.number, payment_type: 'C', value: 10.0 } }
      end

      it 'creates a new transaction' do
        expect do
          do_request
        end.to change(Transaction, :count).by(1)
      end

      it 'returns a created status' do
        do_request
        expect(response).to have_http_status(:created)
      end
    end

    context 'when account does not exist' do
      let(:params) do
        { transaction: { account_number: 0, payment_type: 'C', value: 10.0 } }
      end

      it 'does not create a new transaction' do
        expect do
          do_request
        end.not_to change(Transaction, :count)
      end

      it 'returns a not found status' do
        do_request
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'with invalid parameters' do
      let(:params) do
        { transaction: { account_number: account.number, payment_type: 'C', value: -10.0 } }
      end

      it 'returns errors' do
        do_request
        expect(response.parsed_body).to include('value' => ['must be greater than 0'])
      end

      it 'does not create a new transaction' do
        expect do
          do_request
        end.not_to change(Transaction, :count)
      end

      it 'returns a not found status' do
        do_request
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
