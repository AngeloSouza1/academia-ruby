Rails.application.routes.draw do
  devise_for :users, controllers: {
    passwords: 'passwords'
  }


  resources :customers do
    collection do
      get :search
    end
  end

  resources :equipaments do
    collection do
      get :search
    end
  end

  resources :orders

  get "up" => "rails/health#show", as: :rails_health_check

  root "customers#index"
end
