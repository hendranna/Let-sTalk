Talk2me::Application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_calbacks"}
  # :controllers => {:registrations => "registrations"}
  devise_scope :user do
    get '/sign_in', to: 'devise/sessions#new'
    get '/sign_up', to: 'devise/sessions#destroy'
  end
  
  root to: "users#index"

  resources :users, except: [:new, :create, :update, :edit, :destroy]

  resources :users do
    resources :friendships
  end 
  resources :users do
    resources :languages
  end

  resources :users do
    resources :comments
  end
  
  resources :users do 
    get 'page/:page', action: :index, on: :collection
  end

  match "/friendships" => "friendships#create", :via => :post, :as => :create_friendship

  match "/friendships" => "friendships#destroy", :via => :delete, :as => :destroy_friendship

  match "/comments" => "comments#create", :via => :post, :as => :create_comment


  match 'search', to: 'search#index', via: [:get, :post], as: :search
  


end
