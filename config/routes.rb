StatusBoard::Application.routes.draw do
  devise_for :people
  resources :projects do
    member do
      post :leave, :join
      get :select
    end
  end
  resources :statuses
  root :to => "home#index"
end
