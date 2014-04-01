Goalsetter::Application.routes.draw do
  resource :session, :only => [:new, :create, :destroy]
  resources :users, :only => [:new, :create, :show, :index]
  root :to => "users#index"
  resources :comments, :only => [:create]
  resources :goals
end
