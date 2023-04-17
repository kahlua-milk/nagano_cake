Rails.application.routes.draw do

  get 'addresses/index'
  get 'addresses/edit'
  get 'genres/index'
  get 'genres/edit'
  get 'orders/new'
  get 'orders/index'
  get 'orders/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
