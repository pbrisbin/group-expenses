GrpExp::Application.routes.draw do

  match 'about' => 'about#index', :as => :about

  root :to => 'welcome#index'

end
