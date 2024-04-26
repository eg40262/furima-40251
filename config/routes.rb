Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :orders, only: [:index] 
  end
  root to: 'items#index'
end

