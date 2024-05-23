# frozen_string_literal: true

Rails.application.routes.draw do
  resources :accounts, only: %i[create show], param: :number
  resources :transactions, only: :create
end
