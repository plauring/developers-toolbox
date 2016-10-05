Rails.application.routes.draw do
  root "devtools#index"
  resources :devtools, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:new, :create] do
    member do
    post 'upvote'
    end
  end

  # resources :reviews do
  #   post 'upvote'
  # end

  devise_for :users

  resources :users

end
