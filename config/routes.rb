Rails.application.routes.draw do
  resources :merchants, only: [:index, :show]
  resources :items, only: [:index, :show]
end
