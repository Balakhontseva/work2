  Test1::Application.routes.draw do
  resources :posts, :only => [:create, :destroy]
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, :only => [:create, :destroy]

  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/users', :to => 'users#index'
  root :to => 'posts#index'
end

