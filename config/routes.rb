Rails.application.routes.draw do
  resources :wikis
  resources :charges, only: [:new, :create]
  
  devise_for :users
  resources :users, only: [:update, :show, :index]

  get 'about' => 'welcome#about'
  root to: 'welcome#index'
end
