Rails.application.routes.draw do
  get 'user/index' => 'user#index'
  post 'user/:id/do_follow' => 'user#do_follow'
  post 'user/:id/remove_follow' => 'user#remove_follow'
  get 'user/:id/following' => 'user#following'
  get 'user/:id/followed' => 'user#followed'
  get 'user/:id/show' => 'user#show'
  devise_for :users

  root 'post#index'
  get 'post/index' => 'post#index'
  get 'post/:id/show' => 'post#show'
  get 'post/new' => 'post#new'
  post 'post/create' =>'post#create'
  get 'post/:id/edit' => 'post#edit'
  put 'post/:id/update' =>'post#update'
  delete 'post/:id/destroy' =>'post#destroy'
  put 'post/:id/favorite' => 'post#favorite',as: 'post_favorite'
  delete 'post/:id/remove_favorite' => 'post#remove_favorite',as: 'post_remove_favorite'
  get 'post/:id/favorite_user' =>'post#favorite_user'
end
