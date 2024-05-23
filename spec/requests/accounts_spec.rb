# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Accounts' do
  describe 'POST /accounts' do
    let(:params) { { account: { number: '123', balance: 100 } } }
    let(:do_request) { post accounts_path(params) }

    it 'returns the account', :aggregate_failures do
      do_request
      expect(response).to have_http_status(:created)
      expect(response.parsed_body).to include('balance' => '100.0', 'number' => 123)
    end

    context 'with invalid params' do
      let(:params) { { account: { balance: 100 } } }

      it 'returns errors', :aggregate_failures do
        do_request
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.parsed_body).to include('number' => ["can't be blank"])
      end
    end
  end

  describe 'GET /account' do
    let(:account) { create(:account) }
    let(:params) { { number: account.number } }
    let(:do_request) { get account_path(params) }

    it 'returns the accounts', :aggregate_failures do
      do_request
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body).to include('number' => account.number, 'balance' => account.balance.to_s)
    end

    it 'returns 404' do
      get account_path(number: 0)
      expect(response).to have_http_status(:not_found)
    end
  end
end
