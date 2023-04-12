Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  resources :users, only: [:index,:show] do
    resources :posts, only: [:index,:show, :new, :create] do
      resources :comments, only: [:new, :create]
    end
  end

  post '/users/:user_id/posts', to: 'posts#create', as: 'create_user_post'
  post '/users/:user_id/posts/:id/likes', to: 'likes#create', as: 'create_post_like'
  get '/users/:user_id/posts/:post_id/comments/new', to: 'comments#new', as: 'new_post_comment'
  post '/users/:user_id/posts/:post_id/comments', to: 'comments#create', as: 'create_post_comment'
  get 'users/:user_id/posts/:post_id', to: 'posts#show'

  


end
