Rails.application.routes.draw do
  root "photos#index"

  devise_for :users

  resources :likes
  resources :follow_requests
  resources :comments
  resources :photos


  get ":username/liked" => "photos#liked", as: :liked_photo
  get ":username/feed" => "photos#feed", as: :feed_photo
  get ":username/followers" => "follow_requests#followers", as: :followers
  get ":username/following" => "follow_requests#following", as: :following

  get ":username" => "users#show", as: :user
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
