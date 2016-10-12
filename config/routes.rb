Rails.application.routes.draw do
  root "devtools#index"

  resources :devtools, only: [:index, :show, :new, :create, :destroy] do
    resources :reviews, only: [:new, :create, :destroy]
  end

  devise_for :users


  resources :users, only: [:show, :index, :create, :destroy]
end
