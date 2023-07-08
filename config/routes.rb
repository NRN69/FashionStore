# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  mount Avo::Engine, at: Avo.configuration.root_path

  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'

  resources :product, only: [:show]

  resources :category, only: [:show]

  root to: 'main#index'
end
