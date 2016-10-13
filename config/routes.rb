Rails.application.routes.draw do
  root "devtools#index"

  devise_for :users

  resources :users, only: [:show, :index, :create, :destroy]

  resources :reviews do
    member do
      post 'upvote'
      post 'downvote'
    end
  end

  resources :devtools do
    resources :reviews
  end
end
