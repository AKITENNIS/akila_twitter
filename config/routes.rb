Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'home/index' => 'home#index'
  get 'home/:id/show' => 'home#show'
  get 'home/new' => 'home#new'
  post 'home/create' =>'home#create'
  get 'home/:id/edit' => 'home#edit'
  put 'home/:id/update' =>'home#update'
  delete 'home/:id/destroy' =>'home#destroy'
  put 'home/:id/favorite' => 'home#favorite',as: 'home_favorite'
  get 'users/:id' => 'users#show'

end
