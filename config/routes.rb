Rails.application.routes.draw do
  mount Avo::Engine, at: Avo.configuration.root_path

  resources :product, only: [:show]

  resources :category, only: [:show]

  root to: 'main#index'
end
