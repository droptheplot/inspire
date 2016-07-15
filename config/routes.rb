Rails.application.routes.draw do
  root 'publications#index'

  resources :publications, only: [:index, :show, :create]
  get 'publications/new/:type' => 'publications#new', as: :new_publication

  resources :authors, only: :index
  resources :rules, only: :index
end
