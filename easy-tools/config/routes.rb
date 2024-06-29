
Rails.application.routes.draw do
  devise_for :users


  resources :customers do
    collection do
      get :search
    end
  end
  resources :equipaments

  resources :orders

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
   root "customers#index"




end