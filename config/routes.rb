GrpExp::Application.routes.draw do

  resource :session

  resource :profile

  resources :groups

  resources :memberships

  root :to => 'welcome#index'

end
