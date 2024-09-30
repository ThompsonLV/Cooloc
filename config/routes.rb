Rails.application.routes.draw do
  root to: "flatmates#index"

  resources :flatmates, only: [:index, :show, :new, :create]
end
