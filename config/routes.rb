Rails.application.routes.draw do
  devise_for :users
  get 'pages/index'

  get 'pages/about'

  get 'pages/help'

  root 'pages#index'

end
