# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  authenticate :user, ->(user) { user.admin? } do
    mount Avo::Engine, at: Avo.configuration.root_path
  end

  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'

  resources :products, only: [:show] do
    resources :reviews, except: %i[index show]
  end

  resources :reviews, except: %i[index show] do
    resources :answers, except: %i[index show]
  end

  resources :category, only: [:show]

  resources :orders

  resources :favorites, only: %i[index create destroy]

  root to: 'main#index'
end
