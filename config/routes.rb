Rails.application.routes.draw do
  devise_for :users
  get 'users/index' => 'users#index'
  get 'users/:id/do_follow' => 'users#do_follow'
  get 'users/:id/remove_follow' => 'users#remove_follow'
  get 'users/:id/following' => 'users#following'
  get 'users/:id/followed' => 'users#followed'
  get 'users/:id/show' => 'users#show'

  root 'posts#index'
  get 'posts/index' => 'posts#index'
  get 'posts/:id/show' => 'posts#show'
  get 'posts/new' => 'posts#new'
  post 'posts/create' =>'posts#create'
  get 'posts/:id/edit' => 'posts#edit'
  put 'posts/:id/update' =>'posts#update'
  delete 'posts/:id/destroy' =>'posts#destroy'
  put 'posts/:id/favorite' => 'posts#favorite',as: 'post_favorite'
  delete 'posts/:id/remove_favorite' => 'posts#remove_favorite',as: 'post_remove_favorite'
  get 'posts/:id/favorite_user' =>'posts#favorite_user'
end
