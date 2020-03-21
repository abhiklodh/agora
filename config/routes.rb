Rails.application.routes.draw do
  root 'static#welcome'

  devise_for :users, path: 'user', controllers: {
    sessions: 'user/sessions',
    registrations: 'custom_devise/registrations',
    passwords: 'custom_devise/passwords'
  }

  namespace :user do
    get 'dashboard', to: 'area#dashboard'
    get 'show_profile', to: 'profile#display'
    put 'update_profile', to: 'profile#update'
    resources :chats do
      post 'create_message', to: 'message#create'
    end
  end

end
