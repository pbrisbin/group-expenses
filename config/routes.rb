GrpExp::Application.routes.draw do

  match 'about' => 'about#index', :as => :about

  resource :session

  match 'login' => 'sessions#new', :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout

  resource :profile

  match 'signup' => 'profiles#new', :as => :signup

  resources :groups

  root :to => 'welcome#index'

end
