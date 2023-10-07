Rails.application.routes.draw do
  devise_for :users
  resources :press_releases
  resources :organizations
  resources :publishers
  root to: "home#index" 
end
