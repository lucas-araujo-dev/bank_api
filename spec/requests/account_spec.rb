# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Account' do
  describe 'POST /account' do
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
end
