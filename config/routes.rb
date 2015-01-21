Rails.application.routes.draw do
  resources :likes

  resources :comments

  get 'article/new'

  get 'article/create'

  get 'article/destroy'

  get 'photos/new'

  get 'photos/create'

  get 'photos/destroy'

  get 'photos_controller/new'

  get 'photos_controller/create'

  get 'photos_controller/destroy'

  get 'index/show'

  get 'index/new'

  get 'index/create'

  get 'index/destroy'
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
