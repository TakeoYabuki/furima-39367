Rails.application.routes.draw do
  # get 'purchase/index'
devise_for :users
 root to: "items#index"
 resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
  resources :purchase, only: [:index, :new, :create]
 end
 
end
