Rails.application.routes.draw do
  root 'sessions#index'
  
  resources :users  do
    resources :profile_pictures
    resources :posts
  end
  
  resources :sessions

  post 'users/:user_id/profile_pictures/:profile_picture_id/likes', to: 'likes#create', as: :profile_pictures_like
  post 'users/:user_id/posts/:post_id/likes', to: 'likes#create', as: :posts_like
  post 'users/:user_id/profile_pictures/:profile_picture_id/comments', to: 'comments#create', as: :profile_pictures_comment
  post 'users/:user_id/posts/:post_id/comments', to: 'comments#create', as: :posts_comment
  get 'users/:user_id/search', to: 'users#search', as: :seraching 
  post 'users/:user_id/:user1_id/friends', to: 'friends#create', as: :friend_request
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
