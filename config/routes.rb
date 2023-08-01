# frozen_string_literal: true

Rails.application.routes.draw do
  get 'likes/update'
  get 'favorites/update'
  devise_for :users

  authenticate :user, ->(user) { user.admin? } do
    mount Avo::Engine, at: Avo.configuration.root_path
  end

  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'

  resources :product

  resources :category, only: [:show]

  resources :orders

  resources :likes, only: %i[index create destroy]

  root to: 'main#index'
end
