Rails.application.routes.draw do
  get 'stocks/index'
  root 'pages#landing'

  devise_for :users
  get '/dashboard', to: 'dashboard#index'
end
