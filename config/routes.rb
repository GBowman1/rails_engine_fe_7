Rails.application.routes.draw do
  resources :merchants do
    resources :items, only: [:index]
  end
end
