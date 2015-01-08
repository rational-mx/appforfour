Rails.application.routes.draw do
  resources :posts

  devise_for :users
  get 'pages/index'

  get 'pages/about'

  get 'pages/help'

  root 'pages#index'

end
