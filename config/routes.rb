Rails.application.routes.draw do
  # get 'users/show'
  root to: "home#top"
  get 'rooms/index'
  get 'home/top'
  resources :home
  resources :rooms

  devise_for :users
  resources :users, :only => [:show]
  resources :users
  get "/home/top"
end
