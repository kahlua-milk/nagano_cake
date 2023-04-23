Rails.application.routes.draw do

  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root :to => "homes#top"
    get "about" => "homes#about"
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

    # customers コントローラー
    get "customers" => "customers#show"
    get "/customers/information/edit"  => "customers#edit"
    patch "customers" => "customers#update"
    get "/customers/unsubscribe" => "customers#unsubscribe", as: "unsubscribe"
    patch "/customers/withdrawal" => "customers#withdrawal", as: "withdrawal"

    # cart_products コントローラー
    get "cart_items" => "cart_products#index"
    post "cart_items" => "cart_products#create"
    patch "/cart_items/:id" => "cart_products#update", as: "cart_item_update"
    delete "/cart_items/destroy_all" => "cart_products#destroy_all", as: "destroy_all"
    delete "/cart_items/:id" => "cart_products#destroy", as: "cart_item_destroy"

    # orders コントローラー
    post "/orders/confirm" => "orders#confirm", as: "confirm"
    get "/orders/thanks" => "orders#thanks", as: "thanks"
    resources :orders, only: [:new, :create, :index, :show]

    # products コントローラー
    get "items" => "products#index"
    get "/items/:id" => "products#show"

  end




  # 管理者用
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }


  namespace :admin do
    root :to => "homes#top"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_products, only: [:update]
  
    # products コントローラー
    get "items" => "products#index"
    get "/items/new" => "products#new"
    post "items" => "products#create"
    get "/items/:id" => "products#show"
    get "/items/:id/edit" => "products#edit", as: 'edit_items'
    patch "/items/:id" => "products#update"

  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
