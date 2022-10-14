Rails.application.routes.draw do
  resources :admin do 
    member do
      patch :change_status
    end
  end

  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }
  root 'pages#landing'

  get '/pending' => 'admin#pending', as: :pending

end
