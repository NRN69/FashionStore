# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  authenticate :user, ->(user) { user.admin? } do
    mount Avo::Engine, at: Avo.configuration.root_path
  end

  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'

  resources :product, only: [:show] do
    resources :comments, only: %i[create edit destroy]
  end

  resources :comments, only: %i[create edit destroy] do
    resources :answers, only: %i[create edit destroy]
  end

  resources :category, only: [:show]

  resources :orders

  resources :likes, only: %i[index create destroy]

  root to: 'main#index'
end
