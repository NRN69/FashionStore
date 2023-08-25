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

  resources :product, only: [:show] do
    resources :comments, except: %i[index show]
  end

  resources :comments, except: %i[index show] do
    resources :answers, except: %i[index show]
  end

  resources :category, only: [:show]

  resources :orders

  resources :likes, only: %i[index create destroy]

  root to: 'main#index'
end
