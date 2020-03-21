Rails.application.routes.draw do
  root 'application#welcome'

  devise_for :users, controllers: {
    sessions: 'custom_devise/sessions',
    registrations: 'custom_devise/registrations',
    passwords: 'custom_devise/passwords'
  }

  namespace :user do
    get 'dashboard', to: 'area#dashboard'
    get 'show_profile', to: 'profile#display'
    namespace :chat do
      get 'index', to: 'index'
    end
  end

end
