Rails.application.routes.draw do
  get 'creditcard/new'  #users情報を登録した後に削除
  get 'orders/index'    #items情報を登録した後に削除

  root 'items#index'

  resources :items do
    resources :orders, only: [:index] do
    end
  end

  resources :user do
    resources :creditcard, only: [:new] do
    end
  end
end
