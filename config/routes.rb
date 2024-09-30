Rails.application.routes.draw do
  root to: "flatmates#index"
  get "about", to: "pages#about"
  get "flatmates", to: "flatmates#index"
end
