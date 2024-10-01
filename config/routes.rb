Rails.application.routes.draw do
  devise_for :flatmates
  root to: 'pages#home'

  resources :flatmates, only: [:index, :show, :new, :create]
  resources :colocations, only: [:index, :show]
  resources :chores, only: [:index, :show, :new, :create]
  resources :invitations, only: [:new, :create]
  resources :shoppings, only: [:index, :show, :new, :create]
  resources :spendings, only: [:index, :show, :new, :create]
end
