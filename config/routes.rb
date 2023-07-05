# frozen_string_literal: true

Rails.application.routes.draw do

  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'

  mount Avo::Engine, at: Avo.configuration.root_path

  resources :product, only: [:show]

  resources :category, only: [:show]

  root to: 'main#index'
end
