Rails.application.routes.draw do
  get 'admin/index'
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }
  root 'pages#landing'
end
