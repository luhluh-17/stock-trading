Rails.application.routes.draw do
  root 'pages#landing'
  devise_for :users

  get '/dashboard', to: 'dashboard#index'

  resources :stocks
  resources :products
end
