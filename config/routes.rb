Rails.application.routes.draw do
  root to: "home#top"
  get 'home/top'
  resources :home


  resources :reservations
      resources 'reservations' do
      collection do
        post 'confirm'
      end
      member do
        patch 'edit_confirm'
      end
    end
    
  devise_for :users
  resources :users, :only => [:show]
  resources :users
  get "/home/top"
  resources :application do
    collection do
      get 'search'
    end
  end
  resources :rooms
  resources :rooms do
    collection do
        post 'confirm'
      end
      member do
        patch 'edit_confirm'
      end
    end
end
