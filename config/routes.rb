Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show, :index, :destroy]

  resources :reviews do
    member do
      post 'upvote'
      post 'downvote'
    end
  end

  resources :devtools do
    resources :reviews
  end


  root "devtools#index"
end
