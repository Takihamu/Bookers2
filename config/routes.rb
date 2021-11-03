Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about'  => 'homes#about'
  get 'search' => 'books#search'
  resources :books, only: [:new, :create, :update,:index, :show, :edit,:destroy]do
    resources :iine,only:[:create,:destroy]
    resources :favorites, only:[:create,:destroy]
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  resources :users, only: [:index, :create,:show,:edit,:update,:edit, :destroy]do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end