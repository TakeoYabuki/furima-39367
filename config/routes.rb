Rails.application.routes.draw do
 root to: "items#index"
 resources :items, only: [:edit, :index, :new, :show ]
end
