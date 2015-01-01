Rails.application.routes.draw do
  get 'pages/index'

  get 'pages/about'

  get 'pages/help'

  root 'pages#index'

end
