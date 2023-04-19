Rails.application.routes.draw do

  # 顧客用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root :to => "homes#top"
    get "about" => "homes#about"
    resources :products, only: [:index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

    # customers コントローラー
    get "customers" => "customers#show"
    get "/customers/information/edit"  => "customers#edit"
    patch "customers" => "customers#update"
    get "/customers/unsubscribe" => "customers#unsubscribe", as: "unsubscribe"
    patch "/customers/withdrawal" => "customers#withdrawal", as: "withdrawal"

    # cart_items コントローラー
    resources :cart_items, only: [:index, :update, :create, :destroy]
    delete "/cart_items/destroy_all" => "cart_items#destroy_all", as: "destroy_all"

    # orders コントローラー
    resources :orders, only: [:new, :create, :index, :show]
    post "/orders/confirm" => "orders#confirm", as: "confirm"
    get "/orders/thanks" => "orders#thanks", as: "thanks"
  end




  # 管理者用
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }


  namespace :admin do
    root :to => "homes#top"
    resources :products, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_products, only: [:update]
  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
