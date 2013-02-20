GrpExp::Application.routes.draw do

  resource :session

  resource :profile

  resources :groups

  resources :memberships

  resources :expenses

  root :to => 'welcome#index'

end
