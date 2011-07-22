StatusBoard::Application.routes.draw do
  devise_for :people
  root :to => "home#index"
end
