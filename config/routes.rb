Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  get 'prototypes/new'

  root to: "prototypes#index" 
  resources :users
  resources :prototypes do
    resources :comments, only: [:index, :create]
  end
end
