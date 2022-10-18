Rails.application.routes.draw do
  # admin
  resources :admin do
    member do
      patch :update_status
    end
  end

  get '/pending' => 'admin#pending', as: :pending
  get '/userlist' => 'admin#index', as: :userlist
  get '/userlist/:id' => 'admin#show', as: :show
  get '/userlist/:id/edit' => 'admin#edit', as: :edit
  get '/newuser' => 'admin#new', as: :new

  # devise
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }

  # landing
  root 'pages#landing'

  # dashboard
  get 'dashboard', to: 'dashboard#index'

  get 'marketplace', to: 'marketplace#index'
  get 'portfolio', to: 'portfolio#index'
  get 'profile', to: 'profile#index'
  get 'profile/deposit', to: 'profile#deposit'
  get 'iex/stock', to: 'iex#stock'

  resources :stocks, only: %i[index create new]
  resources :products, only: %i[index create new]
  resources :transactions, only: %i[index create new]
end
