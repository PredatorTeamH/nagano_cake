Rails.application.routes.draw do
    devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    resources :items, only: [:index, :show]
    get 'customers/information' => 'customers#show', as: 'customer'
    get    'customers/information/edit' => 'customers#edit',   as: 'edit_customer'
    patch  'customers/information' => 'customers#update', as: 'update_customer'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'customer_unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'customer_withdraw'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_items' => 'cart_items#destroy_all', as: 'destroy_all'
    post 'orders/confirm' => 'orders#confirm', as: 'orders_confirm'
    post 'orders/complete' => 'orders#complete', as: 'orders_complete'
    resources :orders, only: [:new, :index, :create, :show]
    resources :shipping_addresses, only: [:index, :edit, :create, :update, :destroy]
    
  end

  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



