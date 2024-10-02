Rails.application.routes.draw do
  devise_for :flatmates
  root to: 'pages#home'

  resources :colocations, only: [:index, :show]
  resources :chores, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :invitations, only: [:new, :create]
  resources :shoppings, only: [:index, :show, :new, :create]
  resources :spendings
  resources :flatmates, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  resources :colocations, only: [:index, :show] do
    resources :flatmates, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :spendings
    end
  end
end
