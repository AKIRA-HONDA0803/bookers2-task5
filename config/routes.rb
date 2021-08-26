Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update, :create] do
   resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'

 end

  resources :books do
   resources :post_comments, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
 end
  root 'homes#top'
  get '/home/about' => 'homes#about'

get '/search', to: 'searchs#search'

end