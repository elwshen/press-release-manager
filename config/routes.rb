Rails.application.routes.draw do
  root "press_releases#index"

  resources :press_releases
end
