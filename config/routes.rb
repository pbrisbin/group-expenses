GrpExp::Application.routes.draw do

  match 'about' => 'about#index', :as => :about

  resource :session

  match 'login' => 'sessions#new', :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout

  namespace :user do
    resource :profile
    resources :groups
  end

  root :to => 'welcome#index'

end
