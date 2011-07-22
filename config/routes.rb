StatusBoard::Application.routes.draw do
  devise_for :people
  resources :projects
  resources :statuses
  root :to => "home#index"
end
