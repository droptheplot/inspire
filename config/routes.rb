Rails.application.routes.draw do
  root 'publications#index'

  resources :publications, only: [:index, :show]
end
