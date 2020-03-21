Rails.application.routes.draw do
  devise_for :users
  # devise_for :users

  root 'example#my_example_page'
  get 'my_example_page', to: 'example#my_example_page'
end
