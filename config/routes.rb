Rails.application.routes.draw do
  get 'items/new'

  devise_for :users
  resources :users, only: [:show] do
     resources :items, only: [:create, :destroy]
  end
  root to: 'welcome#index'
end
