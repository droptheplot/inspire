Rails.application.routes.draw do
  root 'publications#index'

  resources :publications, only: [:index, :show]
  resources :authors, only: :index
  resources :rules, only: :index
end
