Rails.application.routes.draw do

  resources :devtools, only: [:index, :show, :new, :create, :destroy] do
    resources :reviews, only: [:new, :create, :destroy]
  end

  devise_for :users

  root "devtools#index"

  resources :users, only: [:show]
end
