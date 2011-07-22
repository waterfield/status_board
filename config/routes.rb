StatusBoard::Application.routes.draw do
  devise_for :people
  resources :statuses
  root :to => "home#index"
end
