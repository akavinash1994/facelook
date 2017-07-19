Rails.application.routes.draw do
	root 'sessions#index'
	resources :users  do
    resources :profile_pictures
  end
	resources :sessions

  resources :users do 
    resources :posts
  end

  post 'users/:user_id/profile_pictures/:profile_picture_id/likes', to: 'likes#create', as: :profile_pictures_like
  post 'users/:user_id/posts/:post_id/likes', to: 'likes#create', as: :posts_like
  # get 'users/:id/profilepictures', to: 'profilepictures#new', as: :upload

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
