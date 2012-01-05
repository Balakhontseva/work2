  Test1::Application.routes.draw do
  get "pages/home"

  get "pages/contact"

  resources :posts
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]

  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
   
  root :to => 'users#index'
end

