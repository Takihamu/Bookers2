Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about'  => 'homes#about'
  resources :books, only: [:new, :create, :update,:index, :show, :edit,:destroy]do
    resources :iine,only:[:create,:destroy]
    resources :favorites, only:[:create,:destroy]
  end
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  resources :users, only: [:index, :create,:show,:edit,:update,:edit, :destroy]
  resources :relationships, only: [:create, :destroy]
end