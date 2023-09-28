Rails.application.routes.draw do
  resources :organizations
  resources :publishers
  resources :users
  root "press_releases#index"

  resources :press_releases
end
