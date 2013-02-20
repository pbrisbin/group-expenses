GrpExp::Application.routes.draw do

  resource :session

  resource :profile

  resources :groups

  resources :memberships

  resources :expenses

  resources :payments

  root :to => 'dashboard#show'

end
