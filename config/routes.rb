Rails.application.routes.draw do 

  root 'items#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'addresses/show', to: 'users/registrations#show_address'
    get 'users/:id', to: 'users/registrations#show'
  end
  


  resources :items do
    collection do
      get "set_images"
      get "set_parents"
      get "set_children"
      get "set_grandchildren"
    end
    resources :orders, only: [:index] do
      collection do
        get 'done', to: 'orders#done'
        post 'pay', to: 'orders#pay'
      end
    end
  end

  # resources :users, only: [:index, :new, :show] do
  # end

  resources :creditcard, only: [:new, :show] do
    collection do
      post 'show', to: 'creditcard#show'
      post 'pay', to: 'creditcard#pay'
      post 'delete', to: 'creditcard#delete'
    end
  end

  # resources :addresses, only: [:new, :create]
end
