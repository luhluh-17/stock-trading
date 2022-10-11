Rails.application.routes.draw do
  resources :admin
  
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }
  root 'pages#landing'
end
