Rails.application.routes.draw do
  get 'transactions/index'
  root 'pages#landing'
  devise_for :users

  get '/dashboard', to: 'dashboard#index'

  resources :stocks
  resources :products
  resources :transactions
end
