Rails.application.routes.draw do

  resources :wikis do
    resources :collaborations, only: [:new, :create, :destroy]
  end
  
  resources :charges, only: [:new, :create]
  
  devise_for :users
  resources :users, only: [:update, :show, :index] do
    post 'downgrade'
  end

  get 'about' => 'welcome#about'
  root to: 'welcome#index'
end
