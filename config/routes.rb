Rails.application.routes.draw do

  resources :devtools, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
  end

  devise_for :users

  root "devtools#index"
end
