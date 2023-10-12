Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "stars/top" => "stars#top"
  resources :users, only: [:show] # ユーザーマイページへのルーティング
  resources :stars do
    resources :plays, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :cats
  root 'stars#top'
end
