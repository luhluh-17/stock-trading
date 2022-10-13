Rails.application.routes.draw do
  devise_for :users
  root 'pages#landing'

  get '/dashboard', to: 'pages#dashboard'
end
