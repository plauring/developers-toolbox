Rails.application.routes.draw do
  root "devtools#index"
  resources :devtools, only: [:index, :show, :new, :create, :destroy] do
    resources :reviews, only: [:new, :create, :destroy]
  end

  resources :users, only: [:show, :index, :destroy]

  resources :reviews, only: [:new, :create] do
    member do
    post 'upvote', 'downvote'
    end
  end

  devise_for :users
end
