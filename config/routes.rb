Rails.application.routes.draw do
  # admin
  resources :admin do
    member do
      patch :update_status
    end
  end

  get '/pending' => 'admin#pending', as: :pending
  get '/users' => 'admin#index', as: :users

  # devise
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }

  # landing
  root 'pages#landing'

  # dashboard
  get '/dashboard', to: 'dashboard#index'

  resources :stocks
  resources :products
  resources :transactions
end
