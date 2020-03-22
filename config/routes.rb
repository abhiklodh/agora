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
    resources :items
    get 'contacts', to: 'area#dashboard'
  end

  get '/404', to: 'errors#not_found'
  get '/422', to: 'errors#unacceptable'
  get '/500', to: 'errors#internal_error'

end
