Rails.application.routes.draw do
  resources :devtools, only: [:index, :show, :new, :create] do
    resources :review, only: [:new, :create]
  end
end
