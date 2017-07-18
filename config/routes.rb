Rails.application.routes.draw do
	root 'sessions#index'
	resources :users  do
    resources :profile_pictures
  end
	resources :sessions


  
  # get 'users/:id/profilepictures', to: 'profilepictures#new', as: :upload

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
