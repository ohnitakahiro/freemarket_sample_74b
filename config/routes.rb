Rails.application.routes.draw do
  get 'creditcard/new'

  get 'orders/index'

  root 'items#index'

  resources :items do
    resources :orders, only: [:index] do
    end
  end

  resources :user
 
end
