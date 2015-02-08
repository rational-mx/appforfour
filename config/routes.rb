Rails.application.routes.draw do
  resources :notifications
  resources :device_infs
  resources :likes
  resources :comments

  resources :posts do
    member do
      get 'scroll/:number_of_comments' , action: :scroll, as: :scroll

    end
  end

  devise_for :users

  get 'pages/index'
  get 'pages/about'
  get 'pages/help'

  root 'pages#index'

end
